FROM unifio/consul:0.7.1
MAINTAINER Unif.io, Inc. <support@unif.io>

RUN apk --no-cache --upgrade add ca-certificates curl groff less python py-pip && \
    pip install awscli boto && \
    curl -Ls "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk" > /tmp/glibc-2.23-r3.apk && \
    apk --allow-untrusted add /tmp/glibc-2.23-r3.apk && \
    apk --purge -v del py-pip && \
    rm -rf /tmp/glibc-2.21-r2.apk

COPY handler.py /usr/local/bin/handler.py
COPY start /usr/local/bin/start

ENV MAX_NODES=-1

ENTRYPOINT ["/usr/local/bin/start"]
