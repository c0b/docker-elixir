FROM erlang:21-alpine

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.6.6" \
	LANG=C.UTF-8

# the OTP_VERSION is env set from erlang images, has values like `21.0.3`
RUN set -xe \
	&& OTP_MAJOR_VERSION="${OTP_VERSION%%.*}" \
	&& ELIXIR_DOWNLOAD_URL="https://repo.hex.pm/builds/elixir/${ELIXIR_VERSION}-otp-${OTP_MAJOR_VERSION}.zip" \
	&& ELIXIR_DOWNLOAD_SHA256="bd2f979a3bd7c5a55a951ff27252f3e3b6f4436d338a88c726887648bac000c9" \
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
	&& apk del .build-deps \
	&& mix local.hex --force \
	&& mix local.rebar --force

CMD ["iex"]
