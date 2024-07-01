<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class HelperServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $helper_directory = app_path().'/Helpers/';
        $global_helpers = ['TextHelper'];
        if (!empty($global_helpers)) {
            foreach ($global_helpers as $filename) {
                require_once($helper_directory.$filename.'.php');
            }
        }
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
