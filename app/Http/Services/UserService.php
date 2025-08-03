<?php

namespace App\Http\Services;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Jobs\BulkInsertUsersJob;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class UserService
{
    public function bulkStore(array $users): void
    {
        try{
            dispatch(new BulkInsertUsersJob($users));
        }catch (Exception $e){
            Log::error($e);
            throw $e;
        }
    }

    public function update(UpdateUserRequest $request,int $userId): bool
    {
        try{
            $data=[
                'name'=>$request->name,
                'email'=>$request->email,
                'password'=>Hash::make($request->password),
            ];
            $user = User::find($userId);

            if (!$user) {
                return false;
            }
            $user->update($data);

            $user->syncRoles(['User']);

            return true;
        }catch (Exception $e){
            Log::error($e);
            throw $e;
        }
    }
    public function destroy($id): bool
    {
        $user = User::findOrFail($id);
        return $user->delete();
    }

}
