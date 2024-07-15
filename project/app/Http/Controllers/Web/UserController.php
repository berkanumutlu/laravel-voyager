<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

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
}
