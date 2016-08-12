# docker-php-redis-nginx-varnish
A draft of Docker services.

I'm using Alpine for images, PHP7 and NGINX, NGINX as reverse proxy (I know, why two nginx? It's because of decoupling), REDIS to store sessions and Varnish to cache all.

Varnish has an interesting configuration, and I use nginx to separate NodeJS from Nginx page by page. The idea of using Redis is to share sessions between nodejs and php. That way we can refactor a page step by step and endpoint by endpoin.
