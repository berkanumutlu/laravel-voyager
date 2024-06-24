<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [\App\Http\Controllers\Web\HomeController::class, 'index'])->name('home');
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('tickets/{id}/reply', [App\Http\Controllers\Admin\TicketController::class, 'reply'])->name('admin.tickets.reply');
});
