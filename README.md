# golang-codebox

This repository contains Dockerfile for Golang 1.4.3 image.

You can build the image yourself:

```
$ docker build -t quay.io/syncano/golang-codebox .
```

or pull it from Docker registry:

```
$ docker pull quay.io/syncano/golang-codebox
```

Then you can run Golang code inside Docker container:

```
$ docker run -it -v `pwd`/demo.go:/tmp/source.go \
    quay.io/syncano/golang-codebox go run /tmp/source.go
```
