<?php

namespace App\Providers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class WebServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        if (!request()->fullUrlIs('*admin*') && !request()->fullUrlIs('*api*')) {
            View::composer(['layouts.web'], function ($view) {
                $view->with([
                    'site_name'           => setting('site.title'),
                    'site_slogan'         => setting('site.description'),
                    'site_logo'           => asset('storage/'.setting('site.logo')),
                    'site_logo_secondary' => asset('storage/'.setting('site.logo_secondary')),
                    'favicon'             => asset('storage/'.setting('admin.icon_image'))
                ]);
            });
        }
    }
}
