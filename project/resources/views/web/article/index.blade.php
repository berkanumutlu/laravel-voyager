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
                        <div class="col-md-6">
                            <div
                                class="article-item row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                <div class="col-8 p-4 d-flex flex-column position-static">
                                    <a href="{{ route('article.category', ['category' => $item->category?->slug]) }}">
                                        <strong
                                            class="d-inline-block mb-2 text-primary-emphasis">{{ $item->category?->name }}</strong></a>
                                    <h3 class="mb-0">{{ $item->title }}</h3>
                                    <div class="mb-1 text-body-secondary">
                                        {{ $item->published_at_text ?? $item->created_at }}
                                    </div>
                                    <p class="card-text mb-auto">{!! $item->excerpt !!}</p>
                                    <a href="{{ $item->url }}" class="icon-link gap-1 icon-link-hover stretched-link">
                                        Continue reading
                                        <i class="bi bi-chevron-right"></i>
                                    </a>
                                </div>
                                <div class="col-4 d-none d-lg-block">
                                    @if(!empty($item->image_url))
                                        <img src="{{ $item->image_url }}" alt="{{ $item->title }}"
                                             class="object-fit-cover"
                                             width="250" height="250">
                                    @else
                                        <svg class="bd-placeholder-img" width="200" height="250"
                                             xmlns="http://www.w3.org/2000/svg" role="img"
                                             aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice"
                                             focusable="false"><title>Placeholder</title>
                                            <rect width="100%" height="100%" fill="#55595c"></rect>
                                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                                        </svg>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="alert alert-info">Not found</div>
                @endif
                @if($records->lastPage() > 1)
                    <div class="col-12">
                        <div class="pagination">
                            {{ $records->links() }}
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection
@section("scripts")

@endsection
