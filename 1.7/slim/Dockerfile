FROM erlang:21-slim

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.7.2" \
	ERLANG_MAJOR_VERSION="21" \
	LANG=C.UTF-8

RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://repo.hex.pm/builds/elixir/${ELIXIR_VERSION#*@}-otp-${ERLANG_MAJOR_VERSION#*@}.zip" \
	&& ELIXIR_DOWNLOAD_SHA256="7790fb5d63045e4b3c5482dde05abe90b417b00d532ca4dfd1c1295d0367e777" \
	&& buildDeps=' \
		ca-certificates \
		curl \
		unzip \
	' \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends $buildDeps \
	&& curl -fSL -o elixir-precompiled.zip $ELIXIR_DOWNLOAD_URL \
	&& echo "$ELIXIR_DOWNLOAD_SHA256  elixir-precompiled.zip" | sha256sum -c - \
	&& unzip -d /usr/local elixir-precompiled.zip \
	&& rm elixir-precompiled.zip \
	&& apt-get purge -y --auto-remove $buildDeps \
	&& rm -rf /var/lib/apt/lists/*

CMD ["iex"]
