@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/web/css/pages/login.min.css') }}">
@endsection
@section("content")
    <div class="login-page">
        <div class="d-flex align-items-center py-4 bg-body-tertiary">
            <main class="form-signin w-100 m-auto">
                <form action="{{ route('login.index') }}" method="POST">
                    @csrf
                    <img class="img-fluid mb-4" src="{{ $site_logo }}" alt="Site Logo">
                    <h1 class="h3 mb-3 fw-normal">{{ __('global.login_description') }}</h1>
                    <x-web.alert :errors="$errors"></x-web.alert>
                    <div class="form-floating">
                        <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com"
                               value="{{ old('email') ?? '' }}">
                        <label for="email">{{ __('global.email') }}</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="{{ __('global.password') }}">
                        <label for="password">{{ __('global.password') }}</label>
                    </div>
                    <div class="form-check text-start my-3">
                        <input type="checkbox" class="form-check-input" id="remember" name="remember"
                            {{ old('remember_me') ? 'checked' : '' }}>
                        <label class="form-check-label" for="remember">{{ __('global.remember_me') }}</label>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 py-2">{{ __('global.login') }}</button>
                    <p class="mt-5 mb-3 text-body-secondary">© {{ $site_name }}</p>
                </form>
            </main>
        </div>
    </div>
@endsection
@section("scripts")

@endsection
