# Alpine Linux with s6 service management.
# This image has UID/GID support.
FROM ghcr.io/linuxserver/baseimage-alpine:3.19

# Install go from the official alpine linux build.
COPY --from=golang:1.22.1-alpine3.19 /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"

# Download the go links source.
RUN wget https://github.com/kellegous/go/archive/refs/heads/master.zip \
    -O /golinks.zip

# This expands into "go-master" by GitHub convention.
RUN cd / && unzip /golinks.zip && rm /golinks.zip

# Compile it.
RUN cd /go-master/cmd/go && go build -mod=vendor -o /usr/bin/go

# Copy system configuration.
COPY --chmod=755 /etc /etc

# Create the data directory for the service. Ownership will be patched up at
# service start time.
RUN mkdir /data

# The service runs on port 8067 by default. This can be changed by passing
# --addr=:<port> to the executable.
EXPOSE 8067
