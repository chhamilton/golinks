[![Docker Image](https://img.shields.io/badge/docker%20image-available-green.svg)](https://hub.docker.com/r/chhamilton/golinks/)

# A dockerized "go" short-link service.

## Background

This is a rebuild of https://hub.docker.com/r/kellegous/go, but built against more recent
versions of Alpine Linux and Golang. It also uses the
[Linuxserver.io](https://www.linuxserver.io/) Alpine base image so that it supports
UID/GID environment variables.

## Running the image

```
docker run -d --name golinks -p 8067:8067 -v <hostpath>:/data
```

The folder `/data` stores the database of shortened URLs. The service will run on port 8067.

## Configuration

The service will run with the user and group ID provided via the `PUID` and `PGID` environment
variables, like all linuxserver.io based containers. This defaults to UID=911 and GID=911. Inside
the container, the user and group name is `abc`.

The database is expected to be mounted at `/data` and read/writable by the appropriate
user/group.

## Using the Service
Once you have it all setup, using it is pretty straight-forward.

#### Create a new shortcut
Type `go/edit/my-shortcut` and enter the URL.

#### Visit a shortcut
Type `go/my-shortcut` and you'll be redirected to the URL.

#### Shorten a URL
Type `go` and enter the URL.
