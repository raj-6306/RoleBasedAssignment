<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateUserRequest;
use App\Http\Requests\UserStoreBulkRequest;
use App\Http\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Models\User;

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
        if (!auth()->user()->hasAnyRole(['SuperAdmin', 'Admin'])) {
            //  return "Nooob";
            abort(403, 'Only SuperAdmin or Admin can create users.');
        }

        $this->userService->bulkStore($request->input('users'));

        return response()->json([
            'message' => 'User creation successfully.'
        ]);
    }

    public function update(UpdateUserRequest $request, $id)
    {

        $authUser = auth()->user();
        $targetUser = User::findOrFail($id);

        // Admins can't update other Admins or SuperAdmins
        if ($authUser->hasRole('Admin') && $targetUser->hasAnyRole(['Admin', 'SuperAdmin'])) {
            abort(403, 'Admins cannot update other Admins or SuperAdmins.');
        }

        // Regular users can only update themselves
        if ($authUser->hasRole('User') && $authUser->id !== $targetUser->id) {
            abort(403, 'You can only update your own profile.');
        }

        // Authorization based on Spatie permission
        // $this->authorize('user.update');
        if ($authUser->hasRole('User')) {
            $this->authorize('user.update_own');
        } else {
            $this->authorize('user.update');
        }
        $updated = $this->userService->update($request, $id);

        if ($updated) {
            return response()->json(['message' => 'User updated successfully.']);
        }

        return response()->json(['message' => 'User not found.'], 404);
    }

    public function delete($id): JsonResponse
    {

        $authUser = auth()->user();
        $targetUser = User::findOrFail($id);

        // If user is trying to delete someone else (not allowed)
        if ($authUser->hasRole('User') && $authUser->id !== $targetUser->id) {
            abort(403, 'Users are only allowed to delete their own account.');
        }


        // Admin cannot delete other Admins or SuperAdmins
        if ($authUser->hasRole('Admin') && $targetUser->hasAnyRole(['Admin', 'SuperAdmin'])) {
            abort(403, 'Admins cannot delete other Admins or SuperAdmins.');
        }



        // Authorization check (Spatie-based permission system)
        if ($authUser->id === $targetUser->id && $authUser->hasRole('User')) {

            $this->authorize('user.delete_own');
        } else {

            $this->authorize('user.delete');
        }

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
