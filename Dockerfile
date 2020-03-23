FROM debian:stable-slim

ENV MONERO_CHECKSUM=6cae57cdfc89d85c612980c6a71a0483bbfc1b0f56bbb30e87e933e7ba6fc7e7

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