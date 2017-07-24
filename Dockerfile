FROM multiarch/alpine:armhf-v3.4

RUN set -ex \
    && apk add --no-cache ca-certificates apache2-utils

COPY ./bin/registry /bin/registry
COPY ./etc/config-example.yml /etc/docker/registry/config.yml

VOLUME ["/var/lib/registry"]
EXPOSE 5000

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/etc/docker/registry/config.yml"]