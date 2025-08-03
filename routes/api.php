<?php

use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\RolePermissionSetupController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::post('/login',[AuthController::class,'login'])->name('login');
Route::middleware('auth:sanctum')->group(function () {

Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
Route::post('/users/bulk-store', [UserController::class, 'bulkStore'])->name('users.bulkStore');
Route::post('/users/update/{id}', [UserController::class, 'update'])->name('users.update');
Route::post('/users/delete/{id}', [UserController::class, 'delete']);

Route::get('/setup-rbac', [RolePermissionSetupController::class, 'setup']);


});
