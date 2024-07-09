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
                'id', 'title', 'slug', 'excerpt', 'image', 'meta_description', 'meta_keywords', 'published_at',
                'category_id', 'author_id'
            ])
            ->orderBy('published_at', 'desc')
            ->paginate(16);
        $records->map(function ($item) {
            $item->url = route('article.detail', ['post' => $item]);
            $item->image_url = asset('storage/'.$item->image);
            $item->published_at_text = format_date(\Carbon\Carbon::parse($item->published_at), 'date-text');
        });
        $title = 'Articles';
        return view('web.article.index', compact(['title', 'records']));
    }

    public function show(\TCG\Voyager\Models\Post $post)
    {
        try {
            $hit = $post->hit + 1;
            \Illuminate\Support\Facades\DB::table('posts')->where('id', $post->id)->update(['hit' => $hit]);
        } catch (\Exception $e) {
            //TODO: Hata log düşülebilir.
        }
        $post->load(['category:id,name,slug', 'authorId:id,name,avatar,description']);
        $record = $post;
        if (!empty($record->image)) {
            $record->image_url = asset('storage/'.$record->image);
        }
        if (!empty($record->published_at)) {
            $record->published_at_text = format_date(\Carbon\Carbon::parse($record->published_at), 'date-text');
        }
        if (!empty($record->authorId->avatar)) {
            $record->authorId->image_url = asset('storage/'.$record->authorId->avatar);
        }
        $last_records = \TCG\Voyager\Models\Post::query()->where('status', 'PUBLISHED')->whereNot('id', $record->id)
            ->select(['id', 'title', 'slug', 'image', 'published_at'])
            ->orderBy('published_at', 'desc')
            ->limit(3)->get();
        $last_records->map(function ($item) {
            $item->url = route('article.detail', ['post' => $item]);
            $item->image_url = asset('storage/'.$item->image);
            $item->published_at_text = format_date(\Carbon\Carbon::parse($item->published_at), 'date-text');
        });
        $category_list = \Illuminate\Support\Facades\Cache::remember('category_list', null, function () {
            $records = \TCG\Voyager\Models\Category::query()->where('parent_id', null)->where('status', 1)
                ->select(['id', 'name', 'slug'])
                ->orderBy('name', 'asc')->get();
            $records->map(function ($item) {
                $item->url = route('article.category', ['category' => $item->slug]);
            });
            return $records;
        });
        $social_media_list = \App\Models\SocialMedia::query()->where('status', 1)
            ->select(['name', 'icon', 'link', 'description'])
            ->orderBy('sort', 'asc')->get();
        $title = $record->seo_title ?? $record->title;
        $meta_description = $record->meta_description;
        $meta_keywords = $record->meta_keywords;
        return view('web.article.detail',
            compact([
                'title', 'meta_description', 'meta_keywords', 'record', 'last_records', 'category_list',
                'social_media_list'
            ]));
    }

    public function show_article_page()
    {
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
