<?php
namespace App\Http\Controllers;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\PermissionRegistrar;
use Illuminate\Support\Facades\Auth;

class RolePermissionSetupController extends Controller
{
    public function setup()
    {

         $authUser = Auth::user();

        // Ensure only SuperAdmin can access this setup
        if (!$authUser || !$authUser->hasRole('SuperAdmin')) {
            return response()->json([
                'message' => 'Access denied. Only SuperAdmin can perform this setup.'
            ], 403);
        }

        // Clear permission cache
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        // Define permissions
        $permissions = [
            'user.create',
            'user.view',
            'user.update',
            'user.delete',
            'user.view_own',
            'user.update_own',
            'user.delete_own',
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission , 'guard_name' => 'web']);
        }

        // Roles
        $superAdmin = Role::firstOrCreate(['name' => 'SuperAdmin' , 'guard_name' => 'web' ]);
         $user = Auth::user();
          if ($user && !$user->hasRole('SuperAdmin')) {
         $user->assignRole('SuperAdmin');
    }
        $admin = Role::firstOrCreate(['name' => 'Admin' , 'guard_name' => 'web']);
        $user = Role::firstOrCreate(['name' => 'User' , 'guard_name' => 'web']);

        // Admin can manage users (but not SuperAdmins or Admins)
        $admin->syncPermissions([
            'user.create',
            'user.view',
            'user.update',
            'user.delete',
        ]);

        // User can only view and update their own data
        $user->syncPermissions([
            'user.view_own',
            'user.update_own',
            'user.delete_own',
        ]);

        // SuperAdmin gets everything (you’ll control this via Gate::before)
        return response()->json([
            'message' => 'Roles and permissions created successfully',
            // 'role' => $user->getRoleNames(),
        ]);
    }
}
