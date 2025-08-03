<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $role = Role::firstOrCreate([
            'name' => 'SuperAdmin',
            'guard_name' => 'api',
        ]);

        $user = User::create([
            'name' => 'Admin User',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('Admin@123'),
            'email_verified_at' => now(),
        ]);
        $user->assignRole('SuperAdmin');
    }
}
