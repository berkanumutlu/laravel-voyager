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
    Route::get('articles/category/{category:slug}', "show_category")->name('category');
    Route::get('article/{post:slug}', "show")->name('detail');
});
Route::name('catalog.')->controller('\App\Http\Controllers\Web\CatalogController')->group(function () {
    Route::get('catalogs', "index")->name('list');
    Route::get('catalog/{catalog:slug}', "show")->name('detail');
});
Route::name('news.')->controller('\App\Http\Controllers\Web\NewsController')->group(function () {
    Route::get('news', "index")->name('list');
    Route::get('news/category/{category:slug}', "show_category")->name('category');
    Route::get('news/{news:slug}', "show")->name('detail');
});
Route::name('quality.')->controller('\App\Http\Controllers\Web\QualityController')->group(function () {
    Route::get('quality', "index")->name('list');
    Route::get('quality/{quality:slug}', "show")->name('detail');
});
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('tickets/{id}/reply', [App\Http\Controllers\Admin\TicketController::class, 'reply'])->name('admin.tickets.reply');
});
