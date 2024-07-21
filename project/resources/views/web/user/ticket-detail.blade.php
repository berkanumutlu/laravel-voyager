@extends("layouts.web")
@section("style")

@endsection
@section("content")
    <div class="user-profile-page">
        <div class="container container-page">
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
