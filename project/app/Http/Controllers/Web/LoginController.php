<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\Web\LoginRequest;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('web.login.index');
    }

    public function login(LoginRequest $request)
    {
        $email = $request->email;
        $password = $request->password;
        $remember_me = isset($request->remember);
        $user = User::query()->where("email", $email)->where('role_id', 2)->withTrashed()->first();
        if (!empty($user)) {
            if (!empty($user->deleted_at)) {
                return redirect()->route('login.index')->withErrors([
                    "deleted_at" => "Your account has been blocked."
                ])->onlyInput("email", "remember");
            }
            if ($user->status != 1) {
                return redirect()->route('login.index')->withErrors([
                    "status" => "Your account has not been approved."
                ])->onlyInput("email", "remember");
            }
            if (Hash::check($password, $user->password)) {
                Auth::guard('web')->login($user, $remember_me);
                return redirect()->route('home');
            }
        }
        return redirect()->route('login.index')->withErrors([
            "email" => "Email or password is incorrect."
        ])->onlyInput("email", "remember");
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout(): \Illuminate\Http\JsonResponse
    {
        $response = ['status' => false, 'message' => null];
        if (Auth::guard('web')->check()) {
            try {
                Auth::guard('web')->logout();
                //$request->session()->invalidate();
                //$request->session()->regenerate();
                $response['status'] = true;
                $response['refreshPage'] = true;
            } catch (\Exception $e) {
                $response['message'] = 'An error occurred while logging out.';
            }
        }
        return response()->json($response);
    }

    public function logout_get()
    {
        if (Auth::guard('web')->check()) {
            try {
                Auth::guard('web')->logout();
                //$request->session()->invalidate();
                //$request->session()->regenerate();
            } catch (\Exception $e) {
                //TODO: Hata log düşülebilir.
            }
        }
        return response()->redirect()->back();
    }
}
