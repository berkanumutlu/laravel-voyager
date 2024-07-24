@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/web/css/pages/catalog.min.css') }}">
@endsection
@section("content")
    <div class="catalogs-page">
        <div class="container container-page">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-6 g-3">
                @if($records->total() > 0)
                    @foreach($records as $item)
                        <div class="col">
                            <div class="card shadow-sm">
                                <a href="{{ $item->file_url }}" target="_blank" rel="noopener">
                                    <img class="card-img-top" src="{{ $item->image_url }}" alt="{{ $item->title }}"
                                         width="100%" height="225">
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

@endsection
