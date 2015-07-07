# golang-codebox

Codebox runtime for Go language.

You can build an image yourself

```
$ docker build -t quay.io/syncano/golang-codebox .
```

Or pull it from our registry

```
$ docker pull quay.io/syncano/golang-codebox
```

And then check it on the demo:

```
$ docker run -it -v `pwd`/demo.go:/tmp/source.go \
    quay.io/syncano/golang-codebox go run /tmp/source.go
```

