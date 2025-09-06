FROM alpine:latest

WORKDIR /app

COPY cleanup.sh .
RUN chmod +x cleanup.sh

ENTRYPOINT ["./cleanup.sh"]
