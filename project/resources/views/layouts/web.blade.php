<!doctype html>
<html lang="en">
{{--@formatter:off--}}
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ !empty($title) ? $title.' - '.$site_name : $site_slogan.' - '.$site_name }}</title>
    @yield("head")
    <link rel="stylesheet" href="{{ asset('assets/plugins/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/bootstrap-icons/font/bootstrap-icons.min.css') }}">
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
                <a href="/" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                    <img src="{{ $site_logo_secondary }}" alt="{{ $site_name }} Logo" width="200">
                </a>
                <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                    <li>
                        <a href="#" class="nav-link text-secondary d-flex flex-column">
                            <i class="bi bi-house-door mx-auto fs-4"></i>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white d-flex flex-column">
                            <i class="bi bi-speedometer2 mx-auto fs-4"></i>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white d-flex flex-column">
                            <i class="bi bi-table mx-auto fs-4"></i>
                            Orders
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white d-flex flex-column">
                            <i class="bi bi-grid mx-auto fs-4"></i>
                            Products
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white d-flex flex-column">
                            <i class="bi bi-person-circle mx-auto fs-4"></i>
                            Customers
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="px-3 py-2 border-bottom mb-3">
        <div class="container d-flex flex-wrap justify-content-center">
            <form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto" role="search">
                <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
            </form>
            <div class="text-end">
                <button type="button" class="btn btn-light text-dark me-2">Login</button>
                <button type="button" class="btn btn-primary">Sign-up</button>
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
            <ul class="list-unstyled d-flex">
                <li class="ms-3">
                    <a class="link-body-emphasis" href="#">
                        <i class="bi bi-twitter fs-24"></i>
                    </a>
                </li>
                <li class="ms-3">
                    <a class="link-body-emphasis" href="#">
                        <i class="bi bi-instagram fs-24"></i>
                    </a>
                </li>
                <li class="ms-3">
                    <a class="link-body-emphasis" href="#">
                        <i class="bi bi-facebook fs-24"></i>
                    </a>
                </li>
            </ul>
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