FROM debian:stable-slim

ENV MONERO_CHECKSUM=4615b9326b9f57565193f5bfe092c05f7609afdc37c76def81ee7d324cb07f35

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