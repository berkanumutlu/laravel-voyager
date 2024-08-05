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
            View::composer(['layouts.web', 'web.login.index'], function ($view) {
                $social_media_list = \App\Models\SocialMedia::query()->where('status', 1)
                    ->select(['name', 'icon', 'link', 'description'])
                    ->orderBy('sort', 'asc')->get();
                $view->with([
                    'site_name'           => __('global.site_name'),
                    'site_slogan'         => __('global.site_slogan'),
                    'site_description'    => __('global.site_description'),
                    'site_logo'           => asset('storage/'.setting('site.logo')),
                    'site_logo_secondary' => asset('storage/'.setting('site.logo_secondary')),
                    'favicon'             => asset('storage/'.setting('admin.icon_image')),
                    'social_media_list'   => $social_media_list
                ]);
            });
        }
    }
}
