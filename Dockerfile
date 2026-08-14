FROM php:8.3-fpm-alpine

WORKDIR /var/www

RUN apk add --no-cache \
    bash \
    git \
    curl \
    libzip-dev \
    oniguruma-dev \
    postgresql-dev \
    icu-dev \
    linux-headers \
    $PHPIZE_DEPS

RUN docker-php-ext-install \
    pdo_pgsql \
    mbstring \
    bcmath \
    intl \
    zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY composer.json composer.lock ./

RUN composer install \
    --no-interaction \
    --prefer-dist \
    --no-dev \
    --optimize-autoloader \
    --no-scripts


COPY . .

RUN chown -R www-data:www-data \
    storage \
    bootstrap/cache

EXPOSE 9000

CMD ["php-fpm", "-F"]