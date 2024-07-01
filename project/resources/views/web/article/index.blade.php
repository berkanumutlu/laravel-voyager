@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/web/css/pages/article.min.css') }}">
@endsection
@section("content")
    <div class="articles-page">
        <div class="container container-page">
            <div class="row">
                @if($records->total() > 0)
                    @foreach($records as $item)
                        <div class="col-12">
                            <div class="blog-item">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="blog-thumb">
                                            <a href="{{ $item->url }}">
                                                <img src="{{ $item->image_url }}" alt="{{ $item->title }}">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="blog-content">
                                            <h3 class="blog-title">
                                                <a href="{{ $item->url }}">{{ $item->title }}</a>
                                            </h3>
                                            <div class="blog-meta">
                                                <span class="post-date"><i class="bi bi-calendar-date"></i>{{ $item->published_at_text ?? $item->created_at }}</span>
                                                <span class="author"><i class="bi bi-person-circle"></i>Posted by : {{ $item->authorId?->name }}</span>
                                            </div>
                                            <div class="blog-description">{!! $item->excerpt !!}</div>
                                            <div class="more-button">
                                                <a href="{{ $item->url }}">Read more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="alert alert-info">Not found</div>
                @endif
            </div>
        </div>
    </div>
@endsection
@section("scripts")

@endsection
