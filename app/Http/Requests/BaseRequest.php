<?php

namespace App\Http\Requests;

// Helpers
use App\Helpers\ApiResponse;

// Core
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class BaseRequest extends FormRequest
{
    /**
     * Handle a failed validation attempt.
     *
     * @param  \Illuminate\Contracts\Validation\Validator  $validator
     * @return void
     *
     * @throws \Illuminate\Validation\ValidationException
    */
    protected function failedValidation(Validator $validator)
    {
        if ($this->is('api/*')) {
            throw new HttpResponseException(
                ApiResponse::validationError($validator->errors()->toArray())
            );
        }

        Parent::failedValidation($validator);
    }
}
