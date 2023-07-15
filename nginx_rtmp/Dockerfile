FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="Asia/Tokyo"

RUN apt-get update && \
    apt-get install -yq tzdata nginx libnginx-mod-rtmp curl && \
    rm -rf /var/lib/apt/lists/* && \
    ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime && \
    dpkg-reconfigure tzdata

RUN mkdir -p /data && \
    chown -R www-data:www-data /data 
COPY etc/nginx/conf/nginx.conf /etc/nginx/nginx.conf
#COPY www/*.html /data/

EXPOSE 1935
EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
