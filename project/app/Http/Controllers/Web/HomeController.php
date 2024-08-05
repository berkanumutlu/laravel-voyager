<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Slider;

class HomeController extends Controller
{
    public function index()
    {
        $current_language = \Mcamara\LaravelLocalization\Facades\LaravelLocalization::getCurrentLocale();
        $slider_list = Slider::query()->where('status', 1)
            ->select(['id', 'type', 'media_name', 'title', 'description', 'url'])
            ->withTranslation($current_language)
            ->orderBy('sort', 'asc')->get();
        $slider_list->each(function ($item) {
            if (!empty($item->media_name)) {
                $item->media_url = asset('storage/'.$item->media_name);
            }
        });
        return view('web.home.index', compact('slider_list'));
    }
}
