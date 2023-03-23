FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends gitit \
    && rm -rf /var/lib/apt/lists/*

COPY mime.types /etc/mime.types
RUN git config --global init.defaultBranch main

VOLUME ["/wiki"]
WORKDIR /wiki

COPY entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD ["gitit", "-f", "gitit.conf"]
EXPOSE 5001