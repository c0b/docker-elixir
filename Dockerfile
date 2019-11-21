ARG OTP_MAJOR_VERSION=22
ARG VARIATION_MODIFIER=""

FROM ubuntu as downloader_extractor

RUN apt-get update && apt-get install -y unzip

ARG OTP_MAJOR_VERSION=22
ARG ELIXIR_VERSION="v1.9.4"
ARG ELIXIR_DOWNLOAD_SHA256="10405b5e63549dc65c6a6ab83faf0ec94bdaf5cc3ed5e71eba3432d882baaf8b"

ADD "https://repo.hex.pm/builds/elixir/${ELIXIR_VERSION}-otp-${OTP_MAJOR_VERSION}.zip" /tmp/elixir-precompiled.zip

RUN if [ "$ELIXIR_DOWNLOAD_SHA256" != "dynamic" ]; then \
		echo "$ELIXIR_DOWNLOAD_SHA256  /tmp/elixir-precompiled.zip" | sha256sum -c -; \
	fi \
	&& mkdir /elixir \
	&& unzip -d /elixir /tmp/elixir-precompiled.zip

ARG OTP_MAJOR_VERSION=22
ARG VARIATION_MODIFIER=""
FROM erlang:${OTP_MAJOR_VERSION}${VARIATION_MODIFIER}

# elixir expects utf8.
ENV LANG=C.UTF-8

COPY --from=downloader_extractor /elixir/ /usr/local/

CMD ["iex"]
