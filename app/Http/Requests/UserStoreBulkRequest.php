<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserStoreBulkRequest extends FormRequest
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
            'users' => 'required|array|min:1',
            'users.*.name' => 'required|string|max:255',
            'users.*.email' => 'required|email|unique:users,email',
            'users.*.password' => 'required|string|min:8|confirmed',
        ];
    }

    /**
     * Get custom error messages for validation.
     *
     * @return array
     */
    public function messages(): array
    {
        return [
            'users.required' => 'At least one user must be provided.',
            'users.array' => 'Users data must be an array.',
            'users.min' => 'You must provide at least one user.',

            'users.*.name.required' => 'The name field is required for each user.',
            'users.*.name.string' => 'The name must be a valid string.',
            'users.*.name.max' => 'The name may not be greater than 255 characters.',

            'users.*.email.required' => 'The email field is required for each user.',
            'users.*.email.email' => 'Please provide a valid email address.',
            'users.*.email.unique' => 'This email has already been taken.',

            'users.*.password.required' => 'The password is required for each user.',
            'users.*.password.string' => 'The password must be a string.',
            'users.*.password.min' => 'The password must be at least 8 characters.',
            'users.*.password.confirmed' => 'The password confirmation does not match.',
        ];
    }
}
