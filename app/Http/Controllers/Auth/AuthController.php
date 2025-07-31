<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Resources\LoginResource;
use App\Http\Services\LoginService;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    //

    protected $loginService;

    public function __construct(LoginService $loginService)
    {
        $this->loginService = $loginService;
    }

    public function login(LoginRequest $request)
    {
        $response = $this->loginService->login($request);

        if (!$response['success']) {
            return response()->json([
                'success' => false,
                'message' => $response['message'],
            ], $response['status']);
        }

        return response()->json([
            'success' => true,
            'message' => $response['message'],
            'data' => new LoginResource($response['user'], $response['token']),
        ], $response['status']);
    }

    public function logout(Request $request)
    {
        $this->loginService->logout($request);

        return response()->json([
            'message' => 'Logged out successfully.'
        ]);
    }
}
