<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

class ArticleController extends Controller
{
    public function show_article_page()
    {
        config('app.locale');
        $record = \TCG\Voyager\Models\Page::query()->where('status', 1)->select([
            'id', 'title', 'body', 'image', 'meta_description', 'meta_keywords'
        ])->first();
        if (empty($record)) {
            abort(404);
        }
        if (!empty($record->image)) {
            $record->image_url = asset('storage/'.$record->image);
        }
        $title = $record->title;
        $meta_description = $record->meta_description;
        $meta_keywords = $record->meta_keywords;
        return view('web.article.page', compact(['title', 'meta_description', 'meta_keywords', 'record']));
    }
}
