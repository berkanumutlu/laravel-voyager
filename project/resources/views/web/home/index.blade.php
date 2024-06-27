@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/plugins/owlcarousel/assets/owl.carousel.min.css') }}">
@endsection
@section("content")
    @if(!empty($slider_list))
        <div class="owl-carousel home-slider" data-ride="carousel">
            @foreach($slider_list as $item)
                <div class="slider-item">
                    @if($item->type == 'IMAGE')
                        <img src="{{ $item->media_url }}" alt="{{ $item->title }}">
                    @elseif($item->type == 'VIDEO')

                    @elseif($item->type == 'EXTERNALVIDEOLINK')

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
                loop: false,
                rewind: true,
                nav: true,
                dots: true,
                items: 1,
                margin: 0,
                autoHeight: false,
                autoHeightClass: 'owl-height'
            });
        });
    </script>
@endsection
