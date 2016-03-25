FROM ubuntu:trusty
MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2016-03-25
ENV SYNCANO_APIROOT https://api.syncano.io/

RUN groupadd -r syncano && \
    useradd -u 1000 -r -g syncano syncano -d /tmp -s /bin/bash && \
    mkdir /home/syncano && \
    chown -R syncano /home/syncano

# enable everyone to use /tmp
RUN chmod 1777 /tmp
# -- CUT BEGIN --

ENV GOLANG_VERSION 1.4.3
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.src.tar.gz
ENV GOLANG_DOWNLOAD_SHA1 486db10dc571a55c8d795365070f66d343458c48
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/src/go/bin:$PATH

# gcc for cgo
RUN apt-get update && apt-get install -qqy \
    curl \
    gcc

RUN curl -fsL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
    && echo "$GOLANG_DOWNLOAD_SHA1  golang.tar.gz" | sha1sum -c - \
    && tar -C /usr/src -xzf golang.tar.gz \
    && rm golang.tar.gz \
    && cd /usr/src/go/src && ./make.bash --no-clean 2>&1

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" \
    && chmod -R 777 "$GOPATH"

# -- CUT END --
USER syncano
WORKDIR /tmp
