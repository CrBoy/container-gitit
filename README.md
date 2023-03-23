# Containerized Gitit

[Gitit](https://github.com/jgm/gitit) is a git-based wiki system.

## Build the container image

Build the image using [Docker](https://www.docker.com/) or [Podman](https://podman.io/):

```
podman build . -t gitit
```

## Run the service within just 10 seconds

Just run

```
mkdir mywiki
podman run -itd -v ./mywiki:/wiki -p 5001:5001 gitit
```

and go http://localhost:5001/
