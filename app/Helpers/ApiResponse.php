<?php

namespace App\Helpers;

// Core
use Illuminate\Http\Response;

class ApiResponse
{
    public static function success($data, $message = null)
    {
        return response()->json([
            'message' => $message,
            'data' => $data
        ]);
    }

    public static function error($message, $statusCode = Response::HTTP_BAD_REQUEST)
    {
        $response = [
            'message' => $message,
        ];
        return response()->json($response, $statusCode);
    }

    public static function validationError($errors, $statusCode = Response::HTTP_UNPROCESSABLE_ENTITY)
    {
        return response()->json([
            'message' => 'There are some errors. Kindly correct them and try again.',
            'errors' => $errors
        ], $statusCode);
    }
}