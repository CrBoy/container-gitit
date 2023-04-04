FROM ubuntu:22.04
MAINTAINER CrBoy <crboy@crboy.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends gitit media-types \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8
RUN git config --global init.defaultBranch main

VOLUME ["/wiki"]
WORKDIR /wiki

COPY entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD ["gitit", "-f", "gitit.conf"]
EXPOSE 5001
