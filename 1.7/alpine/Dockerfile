FROM erlang:21-alpine

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.7.3" \
	ERLANG_MAJOR_VERSION="21" \
	LANG=C.UTF-8

RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://repo.hex.pm/builds/elixir/${ELIXIR_VERSION#*@}-otp-${ERLANG_MAJOR_VERSION#*@}.zip" \
	&& ELIXIR_DOWNLOAD_SHA256="2ea1eef6751c54b475225f20caaad20702c198fbddff1cb1513b03aee25a5f90" \
	&& buildDeps=' \
		ca-certificates \
		curl \
		unzip \
	' \
	&& apk add --no-cache --virtual .build-deps $buildDeps \
	&& curl -fSL -o elixir-precompiled.zip $ELIXIR_DOWNLOAD_URL \
	&& echo "$ELIXIR_DOWNLOAD_SHA256  elixir-precompiled.zip" | sha256sum -c - \
	&& unzip -d /usr/local elixir-precompiled.zip \
	&& rm elixir-precompiled.zip \
	&& apk del .build-deps

CMD ["iex"]
