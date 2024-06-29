@extends("layouts.web")
@section("style")

@endsection
@section("content")
    <h1>{{ $record->title }}</h1>
    <p>{!! $record->body !!}</p>
@endsection
@section("scripts")

@endsection
