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
        $records = Quality::query()->where('status', 1)
            ->select(['id', 'title', 'slug', 'image', 'content'])
            ->orderBy('created_at', 'desc')->orderBy('id', 'desc')
            ->paginate(18);
        $records->each(function ($item) {
            $item->image_url = asset('storage/'.$item->image);
        });
        $title = 'Qualities';
        return view('web.quality.index', compact(['title', 'records']));
    }
}
