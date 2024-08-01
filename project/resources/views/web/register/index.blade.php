@extends("layouts.web")
@section("style")

@endsection
@section("content")
    <div class="register-page">
        <div class="container container-page col-xl-10 col-xxl-8">
            <div class="row align-items-center g-lg-5 py-5">
                <div class="col-lg-7 text-center text-lg-start">
                    <h1 class="display-4 fw-bold lh-1 text-body-emphasis mb-3">{{ __('global.register_form_title') }}</h1>
                    <p class="col-lg-10 fs-4">{{ __('global.register_form_description') }}</p>
                </div>
                <div class="col-md-10 mx-auto col-lg-5">
                    <form action="{{ route('register.index') }}" method="POST"
                          class="p-4 p-md-5 border rounded-3 bg-body-tertiary">
                        @csrf
                        <x-web.alert :errors="$errors"></x-web.alert>
                        <div class="form-floating mb-3">
                            <input type="text" id="name" name="name" class="form-control"
                                   placeholder="John Doe" value="{{ old('name') ?? '' }}" required>
                            <label for="name">{{ __('global.full_name') }}</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" id="email" name="email" class="form-control"
                                   placeholder="name@example.com" value="{{ old('email') ?? '' }}" required>
                            <label for="email">{{ __('global.email') }}</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" id="password" name="password" class="form-control"
                                   placeholder="{{ __('global.password') }}" required>
                            <label for="password">{{ __('global.password') }}</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" id="password_confirmation" name="password_confirmation"
                                   class="form-control" placeholder="{{ __('global.confirm_password') }}" required>
                            <label for="password_confirmation">{{ __('global.confirm_password') }}</label>
                        </div>
                        <button type="submit" class="w-100 btn btn-lg btn-primary">{{ __('global.register') }}</button>
                        <hr class="my-4">
                        <small class="text-body-secondary">{{ __('global.register_form_info') }}</small>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@section("scripts")

@endsection
