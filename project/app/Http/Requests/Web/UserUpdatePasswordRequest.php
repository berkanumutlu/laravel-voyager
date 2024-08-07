<?php

namespace App\Http\Requests\Web;

use Illuminate\Foundation\Http\FormRequest;

class UserUpdatePasswordRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'id'               => ['exists:users,id'],
            'current_password' => ['required', 'string'],
            'new_password'     => ['required', 'string', 'different:current_password', 'confirmed', \Illuminate\Validation\Rules\Password::min(8)->letters()->numbers()->symbols()->mixedCase()],
        ];
    }
}
