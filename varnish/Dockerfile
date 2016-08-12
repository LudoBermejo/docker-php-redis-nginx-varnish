FROM alpine:latest
MAINTAINER Ludo Bermejo <LudoBermejo@gmail.com>, domainer

ENV VARNISH_CACHE_SIZE=128m \
    BACKEND_PORT=8000


# VARNISH
RUN apk update && \
    apk upgrade && \
    apk add varnish \
        curl \
        nano

# Make our custom VCLs available on the container
ADD varnish.vcl /opt/varnish.vcl

EXPOSE 80

ADD ./commands/run-commands.sh /run-commands.sh
RUN chmod -v +x /run-commands.sh
RUN ls /opt/ -la
CMD ["./run-commands.sh"]
