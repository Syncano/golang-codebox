FROM ubuntu:trusty
MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2015-12-17
ENV GOLANG_VERSION 1.4.3
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.src.tar.gz
ENV GOLANG_DOWNLOAD_SHA1 486db10dc571a55c8d795365070f66d343458c48
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/src/go/bin:$PATH
# gcc for cgo
RUN apt-get update && apt-get install -y \
    curl \
    gcc

RUN curl -fsL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
    && echo "$GOLANG_DOWNLOAD_SHA1  golang.tar.gz" | sha1sum -c - \
    && tar -C /usr/src -xzf golang.tar.gz \
    && rm golang.tar.gz \
    && cd /usr/src/go/src && ./make.bash --no-clean 2>&1

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" \
    && chmod -R 777 "$GOPATH"

RUN chmod 1777 /tmp
RUN groupadd -r syncano && useradd -r -g syncano syncano
USER syncano
