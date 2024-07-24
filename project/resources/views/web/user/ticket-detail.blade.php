@extends("layouts.web")
@section("style")

@endsection
@section("content")
    <div class="user-profile-page">
        <div class="container container-page">
            <x-web.errors :errors="$errors"></x-web.errors>
            @if(session('message'))
                <div class="w-100">
                    <div class="alert alert-{{ session('alert-type') }}">
                        @if(is_array(session('message')))
                            @foreach(session('message') as $item)
                                {{ $item }}
                            @endforeach
                        @else
                            {{ session('message') }}
                        @endif
                    </div>
                </div>
            @endif
            <x-web.chat
                :record="$record"
                :defaultAvatar="$default_logo"
                :user="$user"
                :messageList="$ticket_messages"
            ></x-web.chat>
        </div>
    </div>
@endsection
@section("scripts")

@endsection
