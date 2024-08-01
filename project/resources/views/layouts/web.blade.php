<!doctype html>
<html lang="{{ $current_language['code'] }}">
{{--@formatter:off--}}
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ !empty($title) ? $title.' - '.$site_name : $site_slogan.' - '.$site_name }}</title>
    @if(!empty($meta_description))
        <meta name="description" content="{!! $meta_description !!}">
    @endif
    @if(!empty($meta_keywords))
        <meta name="keywords" content="{!! $meta_keywords !!}">
    @endif
    <meta name="author" content="Berkan Ümütlü">
    <meta name="publisher" content="Berkan Ümütlü"/>
    <meta name="copyright" content="© Copyright 2024 {{ $site_name }}"/>
    @yield("head")
    <link rel="stylesheet" href="{{ asset('assets/plugins/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/bootstrap-icons/font/bootstrap-icons.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/animate-css/animate.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/web/css/style.min.css') }}">
    @yield("style")
    @stack("style")
</head>
{{--@formatter:on--}}
<body>
<header>
    <div class="px-3 py-2 text-bg-dark border-bottom">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="{{ route('home') }}"
                   class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                    <img src="{{ $site_logo_secondary }}" alt="{{ $site_name }} Logo" width="200">
                </a>
                <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                    <li>
                        <a href="{{ route('home') }}"
                           class="nav-link d-flex flex-column {{ Route::is('home') ? 'text-secondary' : 'text-white' }}">
                            <i class="bi bi-house-door mx-auto fs-4"></i>
                            {{ __('global.home') }}
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('article.about_us') }}"
                           class="nav-link d-flex flex-column {{ Route::is('article.about_us') ? 'text-secondary' : 'text-white' }}">
                            <i class="bi bi-info-square mx-auto fs-4"></i>
                            {{ __('global.about_us') }}
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('article.list') }}"
                           class="nav-link d-flex flex-column {{ Route::is('article.list') ? 'text-secondary' : 'text-white' }}">
                            <i class="bi bi-card-text mx-auto fs-4"></i>
                            {{ __('global.articles') }}
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('catalog.list') }}"
                           class="nav-link d-flex flex-column {{ Route::is('catalog.list') ? 'text-secondary' : 'text-white' }}">
                            <i class="bi bi-grid mx-auto fs-4"></i>
                            {{ __('global.catalogs') }}
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('news.list') }}"
                           class="nav-link d-flex flex-column {{ Route::is('news.list') ? 'text-secondary' : 'text-white' }}">
                            <i class="bi bi-newspaper mx-auto fs-4"></i>
                            {{ __('global.news') }}
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('quality.list') }}"
                           class="nav-link d-flex flex-column {{ Route::is('quality.list') ? 'text-secondary' : 'text-white' }}">
                            <i class="bi bi-award mx-auto fs-4"></i>
                            {{ __('global.quality') }}
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('contact.index') }}"
                           class="nav-link d-flex flex-column {{ Route::is('contact.index') ? 'text-secondary' : 'text-white' }}">
                            <i class="bi bi-chat-left-dots mx-auto fs-4"></i>
                            {{ __('global.contact') }}
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="px-3 py-2 border-bottom">
        <div class="container d-flex flex-wrap justify-content-center">
            <div class="dropdown me-2">
                <a class="btn btn-light dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false">{{ LaravelLocalization::getCurrentLocaleNative() }}</a>
                <ul class="dropdown-menu">
                    @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                        <li>
                            <a class="dropdown-item {{ $localeCode == LaravelLocalization::getCurrentLocale() ? 'active' : '' }}"
                               rel="alternate" hreflang="{{ $localeCode }}"
                               href="{{ LaravelLocalization::getLocalizedURL($localeCode) }}">
                                {{ $properties['native'] }}
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
            <form action="#" class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto" role="search">
                <input type="search" class="form-control" placeholder="{{ __('global.search') }}..."
                       aria-label="{{ __('global.search') }}">
            </form>
            <div class="text-end">
                @if(auth()->guard('web')->check())
                    <div class="dropdown h-100 d-flex align-items-center">
                        <a href="javascript:;" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            @if(!empty(auth()->guard('web')->user()->avatar))
                                <img src="{{ asset('storage/'.auth()->guard('web')->user()->avatar) }}"
                                     alt="{{ auth()->guard('web')->user()->name }}"
                                     class="rounded-circle" width="32" height="32">
                            @else
                                {{ auth()->guard('web')->user()->name }}
                            @endif
                        </a>
                        <ul class="dropdown-menu text-small">
                            <li><a class="dropdown-item"
                                   href="{{ route('user.profile') }}">{{ __('global.profile') }}</a></li>
                            <li><a class="dropdown-item"
                                   href="{{ route('user.tickets') }}">{{ __('global.tickets') }}</a></li>
                            <li><a class="dropdown-item" href="#">{{ __('global.settings') }}</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                @csrf
                                <a class="dropdown-item btnUserLogout"
                                   href="{{ route('logout') }}">{{ __('global.logout') }}</a>
                            </li>
                        </ul>
                    </div>
                @else
                    <a href="{{ route('login.index') }}"
                       class="btn btn-light text-dark me-2">{{ __('global.login') }}</a>
                    <a href="{{ route('register.index') }}" class="btn btn-primary">{{ __('global.register') }}</a>
                @endif
            </div>
        </div>
    </div>
</header>
@yield("content")
<footer class="py-5 border-top">
    <div class="container">
        <div class="row">
            <div class="col-6 col-md-2 mb-3">
                <h5>Section</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a></li>
                </ul>
            </div>

            <div class="col-6 col-md-2 mb-3">
                <h5>Section</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a></li>
                </ul>
            </div>

            <div class="col-6 col-md-2 mb-3">
                <h5>Section</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a></li>
                </ul>
            </div>

            <div class="col-md-5 offset-md-1 mb-3">
                <form>
                    <h5>Subscribe to our newsletter</h5>
                    <p>Monthly digest of what's new and exciting from us.</p>
                    <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email address</label>
                        <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
                        <button class="btn btn-primary" type="button">Subscribe</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="d-flex flex-column flex-sm-row justify-content-between py-4 border-top">
            <p>© 2024 {{ $site_name }}. All rights reserved.</p>
            @if(!empty($social_media_list))
                <ul class="list-unstyled d-flex">
                    @foreach($social_media_list as $item)
                        <li class="ms-3">
                            <a class="link-body-emphasis" href="{{ $item->link }}" target="_blank" rel="noopener">
                                @if(!empty($item->icon))
                                    <i class="{{ $item->icon }} fs-5"></i>
                                @endif
                            </a>
                        </li>
                    @endforeach
                </ul>
            @endif
        </div>
    </div>
</footer>
<script src="{{ asset('assets/plugins/jquery/jquery-3.7.1.min.js') }}"></script>
<script src="{{ asset('assets/plugins/popperjs/popper.min.js') }}"></script>
<script src="{{ asset('assets/plugins/bootstrap/js/bootstrap.min.js') }}"></script>
@yield("script_files")
@stack("script_files")
<script src="{{ asset('assets/web/js/main.js') }}"></script>
@yield("scripts")
@stack("scripts")
</body>
</html>
