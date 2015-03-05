# golang-codebox

Codebox runtime for golang language.

You can build an image yourself

```
$ docker build -t syncano/golang-codebox .
```

And then use it to check it on the demo:
```
$ docker run -it -v `pwd`/demo.go:/tmp/source.go syncano/golang-codebox go run /tmp/source.go
```

