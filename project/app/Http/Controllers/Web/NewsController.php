<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\News;

class NewsController extends Controller
{
    public function index()
    {
        $records = News::query()->where('status', 'PUBLISHED')
            ->with(['category:id,name,slug', 'authorId:id,name'])
            ->select([
                'id', 'title', 'slug', 'excerpt', 'image', 'meta_description', 'meta_keywords', 'published_at',
                'category_id', 'author_id'
            ])
            ->orderBy('published_at', 'desc')
            ->paginate(16);
        $records->map(function ($item) {
            $item->url = route('news.detail', ['news' => $item]);
            $item->image_url = asset('storage/'.$item->image);
            $item->published_at_text = format_date(\Carbon\Carbon::parse($item->published_at), 'date-text');
        });
        $title = 'News';
        return view('web.news.index', compact(['title', 'records']));
    }

    public function show(News $news)
    {
        try {
            $hit = $news->hit + 1;
            \Illuminate\Support\Facades\DB::table('news')->where('id', $news->id)->update(['hit' => $hit]);
        } catch (\Exception $e) {
            //TODO: Hata log düşülebilir.
        }
        $news->load(['category:id,name,slug', 'authorId:id,name,avatar,description']);
        $record = $news;
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
            ->orderBy('published_at', 'desc')
            ->limit(3)->get();
        $last_records->map(function ($item) {
            $item->url = route('news.detail', ['news' => $item]);
            $item->image_url = asset('storage/'.$item->image);
            $item->published_at_text = format_date(\Carbon\Carbon::parse($item->published_at), 'date-text');
        });
        $category_list = \Illuminate\Support\Facades\Cache::remember('category_list_news', null, function () {
            $records = \TCG\Voyager\Models\Category::query()->where('parent_id', null)->where('status', 1)
                ->select(['id', 'name', 'slug'])
                ->orderBy('name', 'asc')->get();
            $records->map(function ($item) {
                $item->url = route('news.category', ['category' => $item->slug]);
            });
            return $records;
        });
        $title = $record->seo_title ?? $record->title;
        $meta_description = $record->meta_description;
        $meta_keywords = $record->meta_keywords;
        return view('web.news.detail',
            compact(['title', 'meta_description', 'meta_keywords', 'record', 'last_records', 'category_list']));
    }
}
