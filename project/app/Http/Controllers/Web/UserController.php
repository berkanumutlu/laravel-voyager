<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class UserController extends Controller
{
    /**
     * Show the form for editing the specified resource.
     */
    public function profile()
    {
        $user = Auth::guard('web')->user();
        $title = 'User Profile';
        return view('web.user.index', compact(['title', 'user']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
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
            return redirect()->route('user.profile')->with('error',
                'Your information could not be saved.')->exceptInput('_token', 'image');
        }
        return redirect()->route('user.profile')->with('success',
            'Your information has been updated successfully.')->onlyInput();
    }
}
