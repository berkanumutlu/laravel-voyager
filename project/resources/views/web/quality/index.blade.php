@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/plugins/fancyapps/fancybox.css') }}">
@endsection
@section("content")
    <div class="quality-page">
        <div class="container container-page">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-6 g-3">
                @if($records->total() > 0)
                    @foreach($records as $item)
                        <div class="col">
                            <div class="card shadow-sm">
                                <a href="{{ $item->image_url }}" data-fancybox="gallery"
                                   data-caption="{{ $item->content }}">
                                    <img src="{{ $item->image_url }}" alt="{{ $item->title }}" class="card-img-top"
                                         width="100%" height="300">
                                    <div class="card-body">
                                        <p class="card-text">{{ $item->title }}</p>
                                    </div>
                                </a>
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
    <script src="{{ asset('assets/plugins/fancyapps/fancybox.umd.js') }}"></script>
    <script>
        jQuery(function ($) {
            Fancybox.bind('[data-fancybox="gallery"]', {
                // Your custom options for a specific gallery
            });
        });
    </script>
@endsection
