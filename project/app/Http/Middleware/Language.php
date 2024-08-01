<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use Symfony\Component\HttpFoundation\Response;

class Language
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        Cache::forget('languages');
        $languages = Cache::remember('languages', null, function () {
            return LaravelLocalization::getLocalesOrder();
        });
        $current_language = LaravelLocalization::getCurrentLocale();
        $languages[$current_language]['code'] = $current_language;
        App::setLocale($current_language);
        Session::put('current_language', $languages[$current_language]);
        $locale = $request->segment(1);
        if (!empty($locale) && strlen($locale) == 2) {
            if (isset($languages[$locale])) {
                App::setLocale($locale);
                Session::put('current_language', $languages[$locale]);
            } else {
                abort(404);
            }
        }
        View::composer('layouts.web', function ($view) use ($request, $languages) {
            $route_parameters = $request->route()->parameters();
            $is_route_dynamic = !empty($route_parameters);
            $languages_with_url = [];
            /*
             * Dinamik route tanımları için mevcut route tanımına ait tüm dillerin kayıtlarını alıp url'lerini oluşturuyor.
             */
            if ($is_route_dynamic) {
                if (count($route_parameters) == 1) {
                    $model = current($route_parameters);
                    $route_binding_field = current($request->route()->parameterNames());
                    $binding_value = $model;
                    $route_query_string = $request->getQueryString();
                    $translate_key_name = 'routes.'.str_replace('.', '_', $request->route()->getName());
                    foreach ($languages as $code => $language) {
                        $language['url'] = LaravelLocalization::getURLFromRouteNameTranslated($code,
                            $translate_key_name, [$route_binding_field => $binding_value]);
                        if (!empty($route_query_string)) {
                            $language['url'] .= '?'.$route_query_string;
                        }
                        $languages_with_url[] = $language;
                    }
                }
            } else {
                foreach ($languages as $code => $language) {
                    $language['url'] = LaravelLocalization::getLocalizedURL($code);
                    $languages_with_url[] = $language;
                }
            }
            if (empty($languages_with_url)) {
                $languages_with_url = $languages;
            }
            $languages = $languages_with_url;
            $current_language = Session::get('current_language');
            $view->with(compact(['languages', 'current_language']));
        });
        return $next($request);
    }
}
