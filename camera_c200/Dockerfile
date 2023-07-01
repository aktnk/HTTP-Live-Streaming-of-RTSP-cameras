FROM jrottenberg/ffmpeg:4.1-alpine

RUN adduser --disabled-password ffmpeg
WORKDIR /home/ffmpeg

COPY convert.sh .
RUN chmod +x convert.sh \
    && chown ffmpeg:ffmpeg convert.sh

ENTRYPOINT exec /home/ffmpeg/convert.sh