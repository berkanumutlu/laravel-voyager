@extends("layouts.web")
@section("style")

@endsection
@section("content")
    <div class="register-page">
        <div class="container container-page col-xl-10 col-xxl-8">
            <div class="row align-items-center g-lg-5 py-5">
                <div class="col-lg-7 text-center text-lg-start">
                    <h1 class="display-4 fw-bold lh-1 text-body-emphasis mb-3">Vertically centered hero sign-up
                        form</h1>
                    <p class="col-lg-10 fs-4">Below is an example form built entirely with Bootstrap’s form controls.
                        Each
                        required form group has a validation state that can be triggered by attempting to submit the
                        form
                        without completing it.</p>
                </div>
                <div class="col-md-10 mx-auto col-lg-5">
                    <form action="{{ route('register.index') }}" method="POST"
                          class="p-4 p-md-5 border rounded-3 bg-body-tertiary">
                        @csrf
                        <div class="form-floating mb-3">
                            <input type="text" id="name" name="name" class="form-control"
                                   placeholder="name@example.com" required>
                            <label for="name">Full Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" id="email" name="email" class="form-control"
                                   placeholder="name@example.com" required>
                            <label for="email">Email address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" id="password" name="password" class="form-control"
                                   placeholder="Password" required>
                            <label for="password">Password</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" id="password_confirmation" name="password_confirmation"
                                   class="form-control" placeholder="Confirm Password" required>
                            <label for="password_confirmation">Confirm Password</label>
                        </div>
                        <button type="submit" class="w-100 btn btn-lg btn-primary">Sign up</button>
                        <hr class="my-4">
                        <small class="text-body-secondary">By clicking Sign up, you agree to the terms of use.</small>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@section("scripts")

@endsection
