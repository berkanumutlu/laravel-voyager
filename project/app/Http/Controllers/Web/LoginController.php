<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

class LoginController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('web.login.index');
    }
}
