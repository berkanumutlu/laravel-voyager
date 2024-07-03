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
Route::name('article.')->controller('ArticleController')->group(function () {
    Route::get('about-us', [\App\Http\Controllers\Web\ArticleController::class, 'show_article_page'])->name('about_us');
    Route::get('articles', [\App\Http\Controllers\Web\ArticleController::class, 'index'])->name('list');
    Route::get('articles/{category:slug}', [\App\Http\Controllers\Web\ArticleController::class, 'index'])->name('category');
    Route::get('article/{post:slug}', [\App\Http\Controllers\Web\ArticleController::class, 'show'])->name('detail');
});
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('tickets/{id}/reply', [App\Http\Controllers\Admin\TicketController::class, 'reply'])->name('admin.tickets.reply');
});
