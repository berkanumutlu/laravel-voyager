<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

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
}
