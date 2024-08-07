<?php

namespace App\Http\Controllers\Web;

use App\Enums\TicketStatus;
use App\Http\Controllers\Controller;
use App\Http\Requests\Web\UserUpdatePasswordRequest;
use App\Models\Ticket;
use App\Models\TicketMessage;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class UserController extends Controller
{
    /**
     * Show the form for editing the specified resource.
     */
    public function profile()
    {
        $user = Auth::guard('web')->user();
        $title = __('global.user_profile');
        return view('web.user.index', compact(['title', 'user']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request): \Illuminate\Http\RedirectResponse
    {
        if (!Auth::guard('web')->check()) {
            abort(401);
        }
        $id = Auth::guard('web')->user()->id;
        $user = User::findOrFail($id);
        $user_image = $user->avatar;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->description = $request->description;
        try {
            $user->save();
            if ($request->file('image')) {
                $folder = 'users';
                $public_path = 'storage/'.$folder;
                $image_file = $request->file('image');
                $image_original_extension = $image_file->getClientOriginalExtension();
                $image_file_name = Str::slug($user->name).'.'.$image_original_extension;
                $image_new = $public_path.'/'.$image_file_name;
                try {
                    $image_file->storeAs($folder, $image_file_name);
                    User::query()->where('id', $id)->update(['avatar' => $image_new]);
                    if (file_exists(public_path($user_image))) {
                        File::delete(public_path($user_image));
                    }
                } catch (\Exception $e) {
                    //TODO: Hata loglanmalı
                }
            }
        } catch (\Exception $e) {
            return redirect()->route('user.profile')->with('error', trans_choice('auth.user_update_profile', 'error'))
                ->exceptInput('_token', 'image');
        }
        return redirect()->route('user.profile')->with('success', trans_choice('auth.user_update_profile', 'success'))
            ->onlyInput();
    }

    /**
     * @param  UserUpdatePasswordRequest  $request
     * @param  User  $user
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update_password(UserUpdatePasswordRequest $request, User $user): \Illuminate\Http\RedirectResponse
    {
        if (!Hash::check($request->current_password, $user->password)) {
            return redirect()->route('user.profile')->with('error_password', __('auth.current_password_failed'))
                ->exceptInput('_token', 'image');
        }
        try {
            $user->password = Hash::make($request->new_password);
            $user->save();
            Auth::guard('web')->logout();
        } catch (\Exception $e) {
            return redirect()->route('user.profile')->with('error_password',
                trans_choice('auth.user_change_password', 'error'))
                ->exceptInput('_token', 'image');
        }
        return redirect()->route('login.index')->with('success', trans_choice('auth.user_change_password', 'success'))
            ->onlyInput();
    }

    public function tickets()
    {
        $records = Ticket::query()->where('sender_id', Auth::guard('web')->id())
            ->with('receiverId:id,name')
            ->select(['id', 'department', 'receiver_id', 'code', 'subject', 'status', 'created_at', 'deleted_at'])
            ->get();
        $records->map(function ($item) {
            $item->url = route('user.ticket.detail', ['ticket' => $item->code]);
            $item->status_text = TicketStatus::from($item->status)->textWithBadge();
            $item->created_at_text = format_date(\Carbon\Carbon::parse($item->created_at), 'date-text-with-hour');
        });
        return view('web.user.tickets', compact('records'));
    }

    public function show_ticket(Ticket $ticket)
    {
        $user = Auth::guard('web')->user();
        $sender_id = Auth::guard('web')->id();
        if ($ticket->sender_id != $sender_id) {
            abort(403);
        }
        $record = Ticket::query()->where('sender_id', $sender_id)
            ->with(['receiverId:id,name,avatar'])
            ->select(['id', 'department', 'receiver_id', 'code', 'subject', 'status', 'created_at', 'deleted_at'])
            ->first();
        if (empty($record)) {
            abort(404);
        }
        $ticket_messages = TicketMessage::where('ticket_id', $record->id)
            ->selectRaw('DATE(created_at) as day, count(*) as message_count')
            ->groupBy('day')
            ->orderBy('day')
            ->get()->map(function ($item) use ($record) {
                $item->messages = TicketMessage::where('ticket_id', $record->id)
                    ->whereDate('created_at', $item->day)
                    ->get()->map(function ($sub_item) {
                        $sub_item->hour = $sub_item->created_at->format('H:i');
                        return $sub_item;
                    });
                $item->messages->load('sender:id,name,email,avatar');
                return $item;
            });
        $default_logo = voyager_asset('images/logo-icon.png');
        return view('web.user.ticket-detail', compact(['record', 'ticket_messages', 'user', 'default_logo']));
    }

    /**
     * @param  Request  $request
     * @param  Ticket  $ticket
     * @return \Illuminate\Http\RedirectResponse
     */
    public function reply_ticket(Request $request, Ticket $ticket): \Illuminate\Http\RedirectResponse
    {
        $validator = Validator::make($request->all(), [
            'message' => ['required', 'string', 'min:2']
        ]);
        if ($validator->fails()) {
            return redirect()->back()->with([
                'message'    => $validator->errors()->all(),
                'alert-type' => 'danger'
            ]);
        }
        try {
            Ticket::query()->findOrFail($ticket->id);
            $ticket_message = new TicketMessage();
            $ticket_message->ticket_id = $ticket->id;
            $ticket_message->sender_id = Auth::guard('web')->id();
            $ticket_message->message = strip_tags(htmlentities($request->message));
            $ticket_message->updated_at = null;
            $ticket_message->save();
            return redirect()->back()->with([
                'message'    => trans_choice('alert.send_ticket_message', 'success'),
                'alert-type' => 'success'
            ]);
        } catch (\Exception $e) {
            return redirect()->back()->with([
                'message'    => trans_choice('alert.send_ticket_message', 'error'),
                'alert-type' => 'danger'
            ]);
        }
    }
}
