<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

class RegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('web.register.index');
    }
}
