@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/web/css/pages/news-detail.min.css') }}">
@endsection
@section("content")
    <div class="news-detail-page">
        <div class="container container-page">
            <div class="row g-5">
                <div class="col-md-9">
                    <h2 class="link-body-emphasis pb-3 mb-3 fst-italic border-bottom">{{ $record->title }}</h2>
                    <article class="news-post">
                        <div class="news-meta">
                            <p class="news-publish-date">
                                <i class="bi bi-calendar2-date"></i>{{ $record->published_at_text ?? $record->published_at }}
                            </p>
                            <p class="news-author">
                                <i class="bi bi-person-bounding-box"></i>by <a
                                    href="#">{{ $record->authorId?->name }}</a>
                            </p>
                            <p class="news-category">
                                <i class="bi bi-stack"></i><a
                                    href="{{ route('news.category', ['category' => $record->category?->slug]) }}">{{ $record->category?->name }}</a>
                            </p>
                            <p class="news-views">
                                <i class="bi bi-eye"></i>{{ $record->hit }}
                            </p>
                        </div>
                        <div class="news-text">{!! $record->body !!}</div>
                    </article>
                </div>
                <div class="col-md-3">
                    <div class="news-sidebar position-sticky" style="top: 2rem;">
                        <div class="news-author p-4 mb-3 bg-body-tertiary rounded">
                            @if(!empty($record->authorId->name))
                                <h4 class="fst-italic">{{ $record->authorId->name }}</h4>
                            @endif
                            @if(!empty($record->authorId->image_url))
                                <div class="news-author-image">
                                    <img src="{{ $record->authorId->image_url }}" alt="{{ $record->authorId?->name }}"
                                         width="128" height="128">
                                </div>
                            @endif
                            @if(!empty($record->authorId->description))
                                <p class="mt-3 mb-0">{{ $record->authorId->description }}</p>
                            @endif
                        </div>
                        @if(!empty($last_records))
                            <div class="last-records">
                                <h4 class="fst-italic">Recent posts</h4>
                                <ul class="list-unstyled">
                                    @foreach($last_records as $item)
                                        <li>
                                            <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top"
                                               href="{{ $item->url }}">
                                                <img src="{{ $item->image_url }}" alt="{{ $item->title }}" width="100%"
                                                     height="96">
                                                <div class="col-lg-8">
                                                    <h6 class="mb-0">{{ $item->title }}</h6>
                                                    <small
                                                        class="text-body-secondary">{{ $item->published_at_text ?? $item->published_at }}</small>
                                                </div>
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        @if(!empty($category_list))
                            <div class="category-list p-4">
                                <h4 class="fst-italic">Categories</h4>
                                <ol class="list-unstyled mb-0">
                                    @foreach($category_list as $item)
                                        <li><a href="{{ $item->url }}">{{ $item->name }}</a></li>
                                    @endforeach
                                </ol>
                            </div>
                        @endif
                        <div class="p-4">
                            <h4 class="fst-italic">Elsewhere</h4>
                            <ol class="list-unstyled">
                                <li><a href="#">GitHub</a></li>
                                <li><a href="#">Twitter</a></li>
                                <li><a href="#">Facebook</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section("scripts")

@endsection