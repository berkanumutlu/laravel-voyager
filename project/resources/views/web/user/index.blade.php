@extends("layouts.web")
@section("style")

@endsection
@section("content")
    <div class="user-profile-page">
        <div class="container container-page">
            <h1>Update Profile</h1>
            <hr>
            <div class="my-2">
                <form action="{{ route('user.profile.edit', ['user' => $user->id]) }}" method="POST">
                    @csrf
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
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="text" id="name" name="name" class="form-control" placeholder="Full Name"
                                       value="{{ old('name') ?? ($user->name ?? '') }}" required>
                                <label for="name">Full Name</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="email" name="email" id="email" class="form-control" placeholder="Email"
                                       value="{{ old('email') ?? ($user->email ?? '') }}" required>
                                <label for="email">Email</label>
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
                                  placeholder="Description">{!! old('description') ?? ($user->description ?? '') !!}</textarea>
                                <label for="description">Description</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="d-flex align-items-center justify-content-md-end">
                                <button type="submit" class="btn btn-primary">Update Profile</button>
                                <button type="reset" class="btn btn-light">Reset Changes</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="my-5">
                <hr>
                <h2>Change Password</h2>
                <form>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="password" id="current_password" name="current_password"
                                       class="form-control" placeholder="Current Password" required>
                                <label for="current_password">Current Password</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="password" id="new_password" name="new_password"
                                       class="form-control" placeholder="New Password" required>
                                <label for="new_password">New Password</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="password" id="new_password_confirmation" name="new_password_confirmation"
                                       class="form-control" placeholder="Confirm New Password" required>
                                <label for="new_password_confirmation">Confirm New Password</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="d-flex align-items-center justify-content-md-end">
                                <button type="button" class="btn btn-primary">Change Password</button>
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
