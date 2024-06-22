
The following will lead to a segfault

```
docker run --rm -it -v .:/workdir -w /workdir --platform=linux/amd64 alpine:3.20
# apk add build-base gfortran
# ./build.sh
```

The following runs fine
```
docker run --rm -it -v .:/workdir -w workdir --platform=linux/amd64 ubuntu
# apt update && apt install -y gfortran
# ./build.sh
```