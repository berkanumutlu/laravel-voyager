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
Route::name('article.')->controller('\App\Http\Controllers\Web\ArticleController')->group(function () {
    Route::get('about-us', "show_article_page")->name('about_us');
    Route::get('articles', "index")->name('list');
    Route::get('articles/{category:slug}', "show_category")->name('category');
    Route::get('article/{post:slug}', "show")->name('detail');
});
Route::name('catalog.')->controller('\App\Http\Controllers\Web\CatalogController')->group(function () {
    Route::get('catalogs', "index")->name('list');
    Route::get('catalog/{catalog:slug}', "show")->name('detail');
});
Route::get('storage/catalogs/{*}', function () {
    dd('test');
});
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('tickets/{id}/reply', [App\Http\Controllers\Admin\TicketController::class, 'reply'])->name('admin.tickets.reply');
});
