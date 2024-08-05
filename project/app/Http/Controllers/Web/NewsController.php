<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\News;

class NewsController extends Controller
{
    public function index()
    {
        $current_language = \Mcamara\LaravelLocalization\Facades\LaravelLocalization::getCurrentLocale();
        $records = News::query()->where('status', 'PUBLISHED')
            ->with(['category:id,name,slug', 'authorId:id,name'])
            ->select([
                'id', 'title', 'slug', 'excerpt', 'image', 'meta_description', 'meta_keywords', 'published_at',
                'category_id', 'author_id'
            ])
            ->withTranslation($current_language)
            ->orderBy('published_at', 'desc')
            ->paginate(16);
        $records->map(function ($item) {
            $item->url = route('news.detail', ['slug' => $item->getTranslatedAttribute('slug')]);
            $item->image_url = asset('storage/'.$item->image);
            $item->published_at_text = format_date(\Carbon\Carbon::parse($item->published_at), 'date-text');
        });
        $title = __('global.news');
        return view('web.news.index', compact(['title', 'records']));
    }

    public function show(string $slug)
    {
        $current_language = \Mcamara\LaravelLocalization\Facades\LaravelLocalization::getCurrentLocale();
        $record = News::query()->whereTranslation('slug', '=', $slug, [$current_language])->first();
        try {
            $hit = $record->hit + 1;
            \Illuminate\Support\Facades\DB::table('news')->where('id', $record->id)->update(['hit' => $hit]);
        } catch (\Exception $e) {
            //TODO: Hata log düşülebilir.
        }
        $record->load(['category:id,name,slug', 'authorId:id,name,avatar,description']);
        if (!empty($record->image)) {
            $record->image_url = asset('storage/'.$record->image);
        }
        if (!empty($record->published_at)) {
            $record->published_at_text = format_date(\Carbon\Carbon::parse($record->published_at), 'date-text');
        }
        if (!empty($record->authorId->avatar)) {
            $record->authorId->image_url = asset('storage/'.$record->authorId->avatar);
        }
        $last_records = News::query()->where('status', 'PUBLISHED')->whereNot('id', $record->id)
            ->select(['id', 'title', 'slug', 'image', 'published_at'])
            ->withTranslation($current_language)
            ->orderBy('published_at', 'desc')
            ->limit(3)->get();
        $last_records->map(function ($item) {
            $item->url = route('news.detail', ['slug' => $item->getTranslatedAttribute('slug')]);
            $item->image_url = asset('storage/'.$item->image);
            $item->published_at_text = format_date(\Carbon\Carbon::parse($item->published_at), 'date-text');
        });
        $category_list = \Illuminate\Support\Facades\Cache::remember('category_list_news', null,
            function () use ($current_language) {
                $records = \TCG\Voyager\Models\Category::query()->where('parent_id', null)->where('status', 1)
                    ->select(['id', 'name', 'slug'])
                    ->withTranslation($current_language)
                    ->orderBy('name', 'asc')->get();
                $records->map(function ($item) {
                    $item->url = route('news.category', ['category' => $item->getTranslatedAttribute('slug')]);
                });
                return $records;
            });
        $social_media_list = \App\Models\SocialMedia::query()->where('status', 1)
            ->select(['name', 'icon', 'link', 'description'])
            ->orderBy('sort', 'asc')->get();
        $title = $record->seo_title ?? $record->title;
        $meta_description = $record->meta_description;
        $meta_keywords = $record->meta_keywords;
        return view('web.news.detail', compact([
            'title', 'meta_description', 'meta_keywords', 'record', 'last_records', 'category_list', 'social_media_list'
        ]));
    }
}
