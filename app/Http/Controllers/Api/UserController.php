<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateUserRequest;
use App\Http\Requests\UserStoreBulkRequest;
use App\Http\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class UserController extends Controller
{
    //
    protected $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function bulkStore(UserStoreBulkRequest $request)
    {
        $this->userService->bulkStore($request->input('users'));

        return response()->json([
            'message' => 'User creation successfully.'
        ]);
    }

    public function update(UpdateUserRequest $request, $id)
    {
        $updated = $this->userService->update($request, $id);

        if ($updated) {
            return response()->json(['message' => 'User updated successfully.']);
        }

        return response()->json(['message' => 'User not found.'], 404);
    }

    public function delete($id): JsonResponse
    {
        $result = $this->userService->destroy($id);

        if ($result) {
            return response()->json([
                'message' => 'User deleted successfully.'
            ], 200);
        }

        return response()->json([
            'message' => 'Failed to delete user.'
        ], 500);
    }
}
