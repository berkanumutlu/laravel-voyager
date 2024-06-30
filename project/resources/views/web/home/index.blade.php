@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/plugins/owlcarousel/assets/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/web/css/pages/home.min.css') }}">
@endsection
@section("content")
    @if(!empty($slider_list))
        <div class="owl-carousel slider-section home-slider" data-ride="carousel">
            @foreach($slider_list as $item)
                <div class="slider-item">
                    @if($item->type == 'IMAGE')
                        <img src="{{ $item->media_url }}" alt="{{ $item->title }}" height="520">
                    @elseif($item->type == 'VIDEO' || $item->type == 'EXTERNALVIDEOLINK')
                        <iframe width="825" height="520" src="{{ $item->media_url }}" title="External video player"
                                frameborder="0"
                                allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                allowfullscreen></iframe>
                    @endif
                    @if(!empty($item->title) || !empty($item->description))
                        <div class="text-section">
                            <h1 class="title">{{ $item->title }}</h1>
                            <h1 class="description">{{ $item->description }}</h1>
                            @if(!empty($item->url))
                                <a class="button" href="{{ $item->url }}">Visit</a>
                            @endif
                        </div>
                    @endif
                </div>
            @endforeach
        </div>
    @endif
@endsection
@section("scripts")
    <script src="{{ asset('assets/plugins/owlcarousel/owl.carousel.min.js') }}"></script>
    <script>
        jQuery(function ($) {
            $('.owl-carousel.home-slider').owlCarousel({
                animateOut: 'slideOutDown',
                animateIn: 'flipInX',
                autoplay: true,
                autoplayHoverPause: false,
                autoplayTimeout: 8000,
                loop: true,
                rewind: true,
                nav: false,
                dots: false,
                items: 1,
                margin: 0,
                autoHeight: false,
                autoHeightClass: 'owl-height'
            });
        });
    </script>
@endsection
