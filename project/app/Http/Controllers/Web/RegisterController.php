<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\Web\UserStoreRequest;
use App\Models\User;

class RegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('web.register.index');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(UserStoreRequest $request)
    {
        try {
            $user = new User();
            $user->name = trim($request->name);
            $user->email = trim($request->email);
            $user->password = bcrypt($request->password);
            $user->role = 2;
            $user->save();
        } catch (\Exception $e) {
            $redirect = redirect()->route('register.index')
                ->exceptInput('_token', 'password', 'password_confirmation');
            if (app()->environment() == 'local') {
                $redirect->withErrors(['error' => $e->getMessage()]);
            } else {
                $redirect->withErrors(['error' => 'Register Error']);
            }
            return $redirect;
        }
        return redirect()->route('register.index')->with('success', 'Register Success')->onlyInput();
    }
}
