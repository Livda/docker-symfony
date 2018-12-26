FROM nginx:alpine

ADD nginx.conf /etc/nginx/
ADD symfony.conf /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf
RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf
RUN addgroup -g 1000 www-data && adduser -u 1000 -G www-data -D www-data

CMD ["nginx"]
EXPOSE 80 443
