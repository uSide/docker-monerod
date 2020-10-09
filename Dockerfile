FROM debian:stable-slim

ENV MONERO_CHECKSUM=2335716555ff0428da0f206a491d9c57b7ae2221d1cfbbb3bf43960d3a2a4dfe

RUN apt-get update && apt-get install -y wget bzip2 && apt-get clean

# MONERO
RUN wget https://downloads.getmonero.org/cli/linux64 \
    && echo "${MONERO_CHECKSUM} linux64" | sha256sum -c \
    && mkdir monero \
    && tar -xvf linux64 -C monero \
    && ls -la monero \
    && cp monero/*/* /usr/local/bin \
    && rm -rf monero linux64

ENTRYPOINT ["/usr/local/bin/monerod"]