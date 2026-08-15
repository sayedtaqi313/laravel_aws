FROM nginx:1.27-alpine

COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY public /var/www/public

RUN rm -f /var/www/public/storage \
    && mkdir -p /var/www/storage/app/public \
    && ln -s /var/www/storage/app/public /var/www/public/storage