<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

class ArticleController extends Controller
{
    public function index()
    {
        $records = \TCG\Voyager\Models\Post::query()->where('status', 'PUBLISHED')
            ->with(['category:id,name,slug', 'authorId:id,name'])
            ->select([
                'id', 'title', 'slug', 'excerpt', 'image', 'meta_description', 'meta_keywords', 'created_at',
                'category_id', 'author_id'
            ])
            ->orderBy('created_at', 'desc')
            ->paginate(15);
        $records->map(function ($item) {
            $item->url = route('article.detail', ['article' => $item]);
            $item->image_url = asset('storage/'.$item->image);
            $item->published_at_text = format_date($item->created_at, 'date');
        });
        $title = 'Articles';
        return view('web.article.index', compact(['title', 'records']));
    }

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
