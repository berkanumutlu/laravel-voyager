@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/web/css/pages/article.min.css') }}">
@endsection
@section("content")
    <div class="article-page">
        <div class="container container-page">
            <div class="row">
                <div class="col-12">
                    @if(!empty($record->image_url))
                        <img class="article-image" src="{{ $record->image_url }}"
                             alt="{{ $record->getTranslatedAttribute('title') }}">
                    @endif
                    <div class="page-heading text-center">
                        <h1 class="page-title">{{ $record->getTranslatedAttribute('title') }}</h1>
                    </div>
                    <div class="article-text">{!! $record->getTranslatedAttribute('body') !!}</div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section("scripts")

@endsection
