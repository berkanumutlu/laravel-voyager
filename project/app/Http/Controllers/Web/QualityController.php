<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Quality;

class QualityController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $current_language = \Mcamara\LaravelLocalization\Facades\LaravelLocalization::getCurrentLocale();
        $records = Quality::query()->where('status', 1)
            ->select(['id', 'title', 'slug', 'image', 'content'])
            ->withTranslation($current_language)
            ->orderBy('created_at', 'desc')->orderBy('id', 'desc')
            ->paginate(18);
        $records->each(function ($item) {
            $item->image_url = asset('storage/'.$item->image);
        });
        $title = __('global.quality');
        return view('web.quality.index', compact(['title', 'records']));
    }
}
