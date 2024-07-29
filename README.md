<p align="center"><a href="https://voyager.devdojo.com" target="_blank"><img width="400" src="https://s3.amazonaws.com/thecontrolgroup/voyager.png"></a></p>
<p align="center">
<a href="https://github.com/berkanumutlu/laravel-voyager/releases/tag/v1.0.0" target="_blank" rel="nofollow"><img src="https://img.shields.io/github/v/release/berkanumutlu/laravel-voyager?logo=github" alt="Laravel Voyager Release"></a>
<a href="https://github.com/berkanumutlu/laravel-voyager/stargazers" rel="nofollow"><img src="https://img.shields.io/github/stars/berkanumutlu/laravel-voyager?style=flat&logo=github" alt="Laravel Voyager Repo stars"></a>
<a href="https://github.com/berkanumutlu/laravel-voyager/blob/master/LICENSE" target="_blank" rel="nofollow"><img src="https://img.shields.io/github/license/berkanumutlu/laravel-voyager" alt="License"></a>
<a href="https://github.com/thedevdojo/voyager/releases/tag/v1.7" target="_blank" rel="nofollow"><img src="https://img.shields.io/badge/Laravel%20Voyager-v1.7-212935?logoColor=white&labelColor=212935&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAAXNSR0IB2cksfwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAXpQTFRFAAAA////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////02MLIAAAAH50Uk5TAAbT1Rj/GQTt7gWkpyycKfj5GyctndgPIWKYmWMO1p8qjgwo4f6ejNkrEOJ+9PAx8fLv9X+QEQ3j5nxAknrkh2lrhYA9gYM79lNkUj/gOMbHOT5V5TIje0F5ZRca0UjPOprU7KaCSUbIaqWoj9fQR86beCJUJIY8hKCRjS8H3Jo8PQAAAm5JREFUeJxjZEABjIyM//6jiqAqYGFkYPyFTwE70Ihv+BQwcDN+YcBUwMvI+BHCZeNiZHwHYQr/ZnsDUyD6QZDxJZCWYGR8zSDG+OcFkC3L+FzqIUyBwrf3Moz3lF+LMT4A8f4z/XqgxHpPmfE63A1a35+oMYLAVSBH5x8zI+OHhwaMp5Acac54FkiaMDL+Yv/P9OcMkG15/zGKL3RuMvDo/TjJ4MC4n8Gc+/wXBru9KN7kV7nE88N6DwODK+MuBgb3QxxfnG88QFYgKnndivUX93YGScNtDN6f+b4d1vz4EEmBhOkjrn8nPd+LMIFcelNjrZIR4w/OVQgFMpzc6isZGILuPP7CwCOrtYKBIfL61dBlYAWMUWt+xux7zWB2lIHB75AvMLI2+S9gYHA5yBDzewl7yDLGpMVxjGuB4W/ArbrdeFviLIb0eclbPFl2PGFg4In8uUiSkZmJOXkZSAEPKwvrtshFIAWP/vzWnglUEDX3bwYjIyvLt5j9rxjctzAwBB6IBVqx0Gwn2Iqche+4/vyGOvKljhrCkbxA5xTtvwJ1JFhB8UZuoDe93yr8/C/x4819zx6QNzW6kQJKjeN6IeNxsx5wQHl+ZTPp1XVvxwhqz3XQoC6fBAzqh9cxIsvwKySylMJmfmFw2I0SWeZfboGim4Vfge8G+++NQLbxU+ToFk/pMub+8Fv9NjjBqNwV+/vsVvq+a3AFyl4z0k+fVGBTh0Sx/G+u6+YuXYJcDxCJVpkJpLz4+sVXDDEveUDRKBswA5FoRRi5IamDgY2bAZbs+dnSWxiIzTgIwB6zDH/WI5h5GRP3xDejiAAAz5bXrrZSiXMAAAAASUVORK5CYII=" alt="Laravel Voyager Version"></a>
<a href="https://laravel.com/docs/10.x" target="_blank" rel="nofollow"><img src="https://img.shields.io/badge/Laravel-v10.48.11-FF2D20?logo=laravel&logoColor=white&labelColor=FF2D20" alt="Laravel Version"></a>
<a href="https://www.php.net/releases/8_1_28.php" target="_blank" rel="nofollow"><img src="https://img.shields.io/badge/PHP-v8.1.28-777BB4?logo=php&logoColor=white&labelColor=777BB4" alt="PHP Version"></a>
<a href="https://getcomposer.org" target="_blank" rel="nofollow"><img src="https://img.shields.io/badge/Composer-v2.6.5-885630?logo=composer&logoColor=white&labelColor=885630" alt="Composer Version"></a>
<a href="https://www.docker.com" target="_blank" rel="nofollow"><img src="https://img.shields.io/badge/Docker-v4.25.2-2496ED?logo=docker&logoColor=white&labelColor=2496ED" alt="Docker Version"></a>
</p>

# Laravel Voyager

It is a project for Laravel Voyager with articles, news, catalogs, qualities, sliders, contact messages, tickets, social_media, currencies.

## Installation

```sh
$ docker-compose up -d
$ docker ps
$ docker exec -it {PHP8_CONTAINER_ID} bash
```

```sh
$ composer global require laravel/installer
```

```sh
$ composer global about
# Changed current directory to /root/.composer
# Composer - Dependency Manager for PHP - version 2.6.5
# Composer is a dependency manager tracking local dependencies of your projects and libraries.
# See https://getcomposer.org/ for more information.
```

```sh
$ export PATH="/root/.composer/vendor/bin:$PATH"
```

```sh
$ laravel new project (or composer create-project --prefer-dist laravel/laravel project)
```

```sh
$ cd project
$ composer require tcg/voyager 1.7 (For Laravel 10)
$ php artisan voyager:install (or php artisan voyager:install --with-dummy)
$ php artisan voyager:admin your@email.com --create
```

```sh
$ php artisan serve
```

## Screenshots

- Home
![home](screenshots/home.png)

- About Us
![about_us](screenshots/about_us.png)

- Articles
![articles](screenshots/articles.png)

- Article Detail
![article_detail](screenshots/article_detail.png)

- Catalogs
![catalogs](screenshots/catalogs.png)

- News
![news](screenshots/news.png)

- Quality
![quality](screenshots/quality.png)

- Contact
![contact](screenshots/contact.png)

- Login
![login](screenshots/login.png)

- Register
![register](screenshots/register.png)

- User Profile
![user_profile](screenshots/user_profile.png)

- User Tickets
![user_tickets](screenshots/user_tickets.png)

- User Ticket Detail
![user_ticket_detail](screenshots/user_ticket_detail.png)


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
