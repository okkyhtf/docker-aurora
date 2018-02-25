FROM alpine:3.7
LABEL maintainer="Okky Hendriansyah <okky.htf@gmail.com>"

COPY aurora.toml /
RUN apk add --no-cache xdg-utils lynx curl \
 && mkdir -p /opt/aurora \
 && cd /opt/aurora \
 && curl -LO https://github.com/xuri/aurora/releases/download/2.1/aurora_linux_amd64_v2.1.tar.gz \
 && tar xvvzpf aurora_linux_amd64_v2.1.tar.gz \
 && rm aurora_linux_amd64_v2.1.tar.gz \
 && mv /aurora.toml /opt/aurora/ \
 && apk del curl
 
EXPOSE 11301
CMD ["/opt/aurora/aurora"]
