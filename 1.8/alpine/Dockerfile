FROM erlang:21-alpine

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.8.0" \
	LANG=C.UTF-8

RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/${ELIXIR_VERSION}.tar.gz" \
	&& ELIXIR_DOWNLOAD_SHA256="c006606095dee5744bab3120527fb4c96c32f0b731fa2508cc786110128f9a3e" \
	&& buildDeps=' \
		ca-certificates \
		curl \
		make \
	' \
	&& apk add --no-cache --virtual .build-deps $buildDeps \
	&& curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
	&& echo "$ELIXIR_DOWNLOAD_SHA256  elixir-src.tar.gz" | sha256sum -c - \
	&& mkdir -p /usr/local/src/elixir \
	&& tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
	&& rm elixir-src.tar.gz \
	&& cd /usr/local/src/elixir \
	&& make install clean \
	&& apk del .build-deps

CMD ["iex"]
