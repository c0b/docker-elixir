FROM erlang:18-slim

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.5.3" \
  OTP_MAJOR_VERSION="18" \
	LANG=C.UTF-8

RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://repo.hex.pm/builds/elixir/${ELIXIR_VERSION}-otp-${OTP_MAJOR_VERSION}.zip" \
	&& ELIXIR_DOWNLOAD_SHA256="9c51a630dcab58b0bbc03d1353b7d5ab244ed7dddf3743fd62d76f9a0fee1363" \
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
