FROM node:12

WORKDIR /core

COPY  entrypoint.sh /

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    build-essential \
    jq \
    iptables \
    python \
	git \
	postgresql-client \
	dos2unix \
    vim && \
    rm -rf /var/lib/apt/lists/*

RUN dos2unix /entrypoint.sh

EXPOSE 4000 4003 4040

