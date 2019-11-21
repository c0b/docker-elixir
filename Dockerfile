ARG OTP_MAJOR_VERSION=22
ARG VARIATION_MODIFIER=""

FROM ubuntu as downloader_extractor

RUN apt-get update && apt-get install -y unzip

ARG VERSION_NAME="v1.9.4-otp-22"

ADD "https://repo.hex.pm/builds/elixir/${VERSION_NAME}.zip" /tmp/elixir-precompiled.zip

RUN mkdir /elixir \
	&& unzip -d /elixir /tmp/elixir-precompiled.zip

ARG OTP_MAJOR_VERSION=22
ARG VARIATION_MODIFIER=""
FROM erlang:${OTP_MAJOR_VERSION}${VARIATION_MODIFIER}

# elixir expects utf8.
ENV LANG=C.UTF-8

COPY --from=downloader_extractor /elixir/ /usr/local/

CMD ["iex"]
