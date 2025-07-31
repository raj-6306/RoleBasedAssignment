<?php

namespace App\Http\Services;

use App\Http\Requests\LoginRequest;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class LoginService
{
    /**
     * Handle user login and return access token.
     *
     * @param LoginRequest $request
     * @return array
     */
    public function login(LoginRequest $request): array
    {
        try {
            Log::info("Attempting login for email: {$request->email}");

            $user = User::where('email', $request->email)->first();

            if (!$user || !Hash::check($request->password, $user->password)) {
                Log::warning("Invalid login attempt for email: {$request->email}");

                return [
                    'success' => false,
                    'status' => 401,
                    'message' => 'Invalid email or password.',
                    'user' => null,
                    'token' => null,
                ];
            }

            $token = $user->createToken('UserAccessToken')->plainTextToken;

            Log::info("Login successful for email: {$user->email}");

            return [
                'success' => true,
                'status' => 200,
                'message' => 'Login successful.',
                'user' => $user,
                'token' => $token,
            ];
        } catch (Exception $e) {
            Log::error("Login error: " . $e->getMessage(), ['exception' => $e]);
            throw $e;
        }
    }

    /**
     * Logout the authenticated user.
     *
     * @return void
     * @throws Exception
     */
    public function logout($request)
    {
        try {
            if (Auth::user()) {
                $request->user()->currentAccessToken()->delete();
            } else {
                Log::warning('Logout called without an authenticated user.');
            }
        } catch (Exception $e) {
            Log::error("Logout error: " . $e->getMessage(), ['exception' => $e]);
            throw $e;
        }
    }
}
