<?php
namespace App\Http\Controllers;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\PermissionRegistrar;

class RolePermissionSetupController extends Controller
{
    public function setup()
    {
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
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission]);
        }

        // Roles
        $superAdmin = Role::firstOrCreate(['name' => 'SuperAdmin']);
        $admin = Role::firstOrCreate(['name' => 'Admin']);
        $user = Role::firstOrCreate(['name' => 'User']);

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
        ]);

        // SuperAdmin gets everything (you’ll control this via Gate::before)
        return response()->json(['message' => 'Roles and permissions created successfully']);
    }
}
