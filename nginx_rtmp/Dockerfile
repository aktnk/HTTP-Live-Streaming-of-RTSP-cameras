FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="Asia/Tokyo"

RUN apt-get update && \
    apt-get install -yq tzdata nginx libnginx-mod-rtmp curl ffmpeg && \
    rm -rf /var/lib/apt/lists/* && \
    ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime && \
    dpkg-reconfigure tzdata

COPY etc/nginx/conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 1935
EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
