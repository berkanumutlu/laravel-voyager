@extends("layouts.web")
@section("style")
    <link rel="stylesheet" href="{{ asset('assets/web/css/pages/contact.min.css') }}">
@endsection
@section("content")
    <div class="catalogs-page">
        <div class="container container-page container-contact100">
            <div class="wrap-contact100">
                <form action="{{ route('contact.message') }}" method="POST" class="contact100-form validate-form">
                    @csrf
                    <span class="contact100-form-title">{{ __('global.contact_title') }}</span>
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
                    <label class="label-input100" for="first_name">{{ __('global.full_name') }} *</label>
                    <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Type first name">
                        <input id="first_name" class="input100" type="text" name="first_name"
                               value="{{ old('first_name') ?? '' }}" required>
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 rs2-wrap-input100 validate-input" data-validate="Type last name">
                        <input class="input100" type="text" name="last_name"
                               value="{{ old('last_name') ?? '' }}" required>
                        <span class="focus-input100"></span>
                    </div>
                    <label class="label-input100" for="email">{{ __('global.email') }} *</label>
                    <div class="wrap-input100 validate-input"
                         data-validate="Valid email is required: ex@abc.xyz">
                        <input id="email" class="input100" type="text" name="email" value="{{ old('email') ?? '' }}"
                               required>
                        <span class="focus-input100"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label class="label-input100" for="phone">{{ __('global.phone') }} *</label>
                            <div class="wrap-input100">
                                <input id="phone" class="input100" type="text" name="phone"
                                       value="{{ old('phone') ?? '' }}" required>
                                <span class="focus-input100"></span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="label-input100" for="company">{{ __('global.company') }}</label>
                            <div class="wrap-input100">
                                <input id="company" class="input100" type="text" name="company"
                                       value="{{ old('company') ?? '' }}">
                                <span class="focus-input100"></span>
                            </div>
                        </div>
                    </div>
                    <label class="label-input100" for="subject">{{ __('global.subject') }} *</label>
                    <div class="wrap-input100">
                        <input id="subject" class="input100" type="text" name="subject"
                               value="{{ old('subject') ?? '' }}" required>
                        <span class="focus-input100"></span>
                    </div>
                    <label class="label-input100" for="message">{{ __('global.message') }} *</label>
                    <div class="wrap-input100 validate-input" data-validate="Message is required">
                        <textarea id="message" class="input100" name="message"
                                  required>{{ old('message') ?? '' }}</textarea>
                        <span class="focus-input100"></span>
                    </div>
                    <div class="container-contact100-form-btn">
                        <button class="contact100-form-btn">{{ __('global.send_message') }}</button>
                    </div>
                </form>
                <div class="contact100-more flex-col-c-m"
                     style="background-image: url('../assets/web/images/pages/contact/contact-bg-01.jpg');">
                    <div class="flex-w size1 p-b-47">
                        <div class="txt1 p-r-20"><i class="bi bi-geo-alt"></i></div>
                        <div class="flex-col size2">
                            <span class="txt1 p-b-20">{{ __('global.address') }}</span>
                            <span class="txt2">{{ $address }}</span>
                        </div>
                    </div>
                    <div class="dis-flex size1 p-b-47">
                        <div class="txt1 p-r-20"><i class="bi bi-telephone"></i></div>
                        <div class="flex-col size2">
                            <span class="txt1 p-b-20">{{ __('global.lets_talk') }}</span>
                            <span class="txt3"><a href="tel:{{ $phone }}">{{ $phone }}</a></span>
                        </div>
                    </div>
                    <div class="dis-flex size1 p-b-47">
                        <div class="txt1 p-r-20"><i class="bi bi-envelope-at"></i></div>
                        <div class="flex-col size2">
                            <span class="txt1 p-b-20">{{ __('global.general_support') }}</span>
                            <span class="txt3"><a href="mailto:{{ $info_email }}">{{ $info_email }}</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section("scripts")

@endsection
