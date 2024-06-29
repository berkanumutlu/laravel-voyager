<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

class ArticleController extends Controller
{
    public function show_article_page()
    {
        $record = \TCG\Voyager\Models\Page::query()->select(['id', 'title', 'body', 'image'])->first();
        if (empty($record)) {
            abort(404);
        }
        $title = $record->title;
        return view('web.article.page', compact(['title', 'record']));
    }
}
