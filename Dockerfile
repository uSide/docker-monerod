FROM debian:stable-slim

ENV MONERO_CHECKSUM=2b95118f53d98d542a85f8732b84ba13b3cd20517ccb40332b0edd0ddf4f8c62

RUN apt-get update && apt-get install -y wget bzip2 && apt-get clean

# MONERO
RUN wget https://downloads.getmonero.org/linux64 \
    && echo "${MONERO_CHECKSUM} linux64" | sha256sum -c \
    && mkdir monero \
    && tar -xvf linux64 -C monero \
    && ls -la monero \
    && cp monero/*/* /usr/local/bin \
    && rm -rf monero linux64

ENTRYPOINT ["/usr/local/bin/monerod"]