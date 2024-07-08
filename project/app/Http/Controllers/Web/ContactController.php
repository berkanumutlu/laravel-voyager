<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Mail\SendContactMessageMail;
use App\Models\ContactMessage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $address = setting('site-contact.address');
        $phone = setting('site-contact.phone');
        $info_email = setting('site-contact.info_email');
        $title = 'Contact';
        return view('web.contact.index', compact(['title', 'address', 'phone', 'info_email']));
    }

    public function message(Request $request)
    {
        //TODO: Captcha kontrolü eklenecek.
        try {
            $data = [
                'name'       => trim($request->first_name).' '.trim($request->last_name),
                'email'      => $request->email,
                'phone'      => $request->phone,
                'company'    => trim($request->company),
                'subject'    => $request->subject,
                'message'    => $request->message,
                'created_at' => date('Y-m-d H:i:s')
            ];
            ContactMessage::insert($data);
            Mail::send(new SendContactMessageMail($data));
            return redirect()->route('contact.index')->with('success', 'Success Message')->exceptInput('token');
        } catch (\Exception $e) {
            //TODO: Hata log düşülebilir.
            return redirect()->route('contact.index')->with('error', 'Error Message')->exceptInput('token');
        }
    }
}
