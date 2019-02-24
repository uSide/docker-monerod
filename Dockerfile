FROM debian:stable-slim

ENV MONERO_CHECKSUM=693e1a0210201f65138ace679d1ab1928aca06bb6e679c20d8b4d2d8717e50d6

RUN apt-get update && apt-get install -y wget bzip2 && apt-get clean

# MONERO
RUN wget https://downloads.getmonero.org/linux64 \
    && echo "${MONERO_CHECKSUM} linux64" | sha256sum -c \
    && mkdir monero \
    && tar -xjvf linux64 -C monero \
    && ls -la monero \
    && cp monero/*/* /usr/local/bin \
    && rm -rf monero linux64

ENTRYPOINT ["/usr/local/bin/monerod"]