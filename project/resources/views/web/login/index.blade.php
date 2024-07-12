@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/web/css/pages/login.min.css') }}">
@endsection
@section("content")
    <div class="login-page">
        <div class="d-flex align-items-center py-4 bg-body-tertiary">
            <main class="form-signin w-100 m-auto">
                <form>
                    <img class="img-fluid mb-4" src="{{ $site_logo }}" alt="Site Logo">
                    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
                    <div class="form-floating">
                        <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
                        <label for="email">Email address</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="Password">
                        <label for="password">Password</label>
                    </div>
                    <div class="form-check text-start my-3">
                        <input class="form-check-input" type="checkbox" name="remember" id="remember">
                        <label class="form-check-label" for="remember">Remember me</label>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 py-2">Sign in</button>
                    <p class="mt-5 mb-3 text-body-secondary">© {{ $site_name }}</p>
                </form>
            </main>
        </div>
    </div>
@endsection
@section("scripts")

@endsection