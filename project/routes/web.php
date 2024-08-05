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
Route::prefix(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::setLocale())->controller('\Mcamara\LaravelLocalization\Facades\LaravelLocalization')->middleware(['localize', 'localizationRedirect'])
->group(function () {
    Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.home'), [\App\Http\Controllers\Web\HomeController::class, "index"])->name('home');
    Route::prefix(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.login'))->name('login.')->controller('LoginController')->middleware('guest:web')->group(function () {
        Route::get('', "index")->name('index');
        Route::post('', "login");
    });
    Route::prefix(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.logout'))->controller('LoginController')->group(function () {
        Route::get('', "logout_get")->name('logout');
        Route::post('', "logout");
    });
    Route::prefix(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.register'))->name('register.')->controller('RegisterController')->middleware('guest:web')->group(function () {
        Route::get('', "index")->name('index');
        Route::post('', "store");
    });
    Route::name('user.')->controller('\App\Http\Controllers\Web\UserController')->middleware('auth:web')->group(function () {
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.profile'), "profile")->name('profile');
        Route::post(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.profile_edit'), "update")->name('profile.edit');
        Route::post(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.profile_change_password'), "update_password")->name('password.edit')->whereNumber('id');
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.tickets'), "tickets")->name('tickets');
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.ticket'), "show_ticket")->name('ticket.detail');
        Route::post(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.ticket_reply'), "reply_ticket")->name('ticket.reply');
    });
    Route::name('article.')->controller('\App\Http\Controllers\Web\ArticleController')->group(function () {
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.about_us'), "show_article_page")->name('about_us');
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.articles'), "index")->name('list');
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.articles_category'), "show_category")->name('category');
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.article_detail'), "show")->name('detail');
    });
    Route::name('catalog.')->controller('CatalogController')->group(function () {
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.catalogs'), "index")->name('list');
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.catalog_detail'), "show")->name('detail');
    });
    Route::name('news.')->controller('NewsController')->group(function () {
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.news'), "index")->name('list');
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.news_detail'), "show")->name('detail');
        Route::get(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.news_category'), "show_category")->name('category');
    });
    Route::prefix(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.quality'))->name('quality.')->controller('QualityController')->group(function () {
        Route::get('', "index")->name('list');
        Route::get('/{quality:slug}', "show")->name('detail');
    });
    Route::prefix(\Mcamara\LaravelLocalization\Facades\LaravelLocalization::transRoute('routes.contact'))->name('contact.')->controller('ContactController')->group(function () {
        Route::get('', "index")->name('index');
        Route::post('', "message")->name('message');
    });
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('tickets/{id}/reply', [App\Http\Controllers\Admin\TicketController::class, 'reply'])->name('admin.tickets.reply');
});
