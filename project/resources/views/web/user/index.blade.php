@extends("layouts.web")
@section("style")

@endsection
@section("content")
    <div class="user-profile-page">
        <div class="container container-page">
            <h1>{{ __('global.update_profile') }}</h1>
            <hr>
            @if(session('success'))
                <div class="w-100">
                    <div class="alert alert-success">{{ session('success') }}</div>
                </div>
            @endif
            @if(session('error'))
                <div class="w-100">
                    <div class="alert alert-danger">{{ session('error') }}</div>
                </div>
            @endif
            <div class="my-2">
                <form action="{{ route('user.profile.edit', ['user' => $user]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="text" id="name" name="name" class="form-control"
                                       placeholder="{{ __('global.full_name') }}"
                                       value="{{ old('name') ?? ($user->name ?? '') }}" required>
                                <label for="name">{{ __('global.full_name') }}</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="email" name="email" id="email" class="form-control"
                                       placeholder="{{ __('global.email') }}"
                                       value="{{ old('email') ?? ($user->email ?? '') }}" required>
                                <label for="email">{{ __('global.email') }}</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex align-items-center my-4">
                                <img src="{{ asset('storage/'.$user->avatar) }}" class="img-fluid"
                                     alt="{{ $user->name }} Image">
                                <input type="file" id="image" name="image" class="ms-2">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                        <textarea id="description" name="description" class="form-control" rows="10"
                                  style="height: 250px"
                                  placeholder="{{ __('global.description') }}">{!! old('description') ?? ($user->description ?? '') !!}</textarea>
                                <label for="description">{{ __('global.description') }}</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="d-flex align-items-center justify-content-md-end">
                                <button type="submit" class="btn btn-primary">{{ __('global.update_profile') }}</button>
                                <button type="reset" class="btn btn-light">{{ __('global.reset_changes') }}</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="my-5">
                <hr>
                <h2 class="mb-4">{{ __('global.change_password') }}</h2>
                <x-web.errors :errors="$errors"></x-web.errors>
                @if(session('success_password'))
                    <div class="w-100">
                        <div class="alert alert-success">{{ session('success_password') }}</div>
                    </div>
                @endif
                @if(session('error_password'))
                    <div class="w-100">
                        <div class="alert alert-danger">{{ session('error_password') }}</div>
                    </div>
                @endif
                <form action="{{ route('user.password.edit', ['user' => $user]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="password" id="current_password" name="current_password"
                                       class="form-control" placeholder="{{ __('global.current_password') }}" required>
                                <label for="current_password">{{ __('global.current_password') }}</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="password" id="new_password" name="new_password"
                                       class="form-control" placeholder="{{ __('global.new_password') }}" required>
                                <label for="new_password">{{ __('global.new_password') }}</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="password" id="new_password_confirmation" name="new_password_confirmation"
                                       class="form-control" placeholder="{{ __('global.confirm_new_password') }}"
                                       required>
                                <label for="new_password_confirmation">{{ __('global.confirm_new_password') }}</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="d-flex align-items-center justify-content-md-end">
                                <button type="submit"
                                        class="btn btn-primary">{{ __('global.change_password') }}</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@section("scripts")

@endsection
