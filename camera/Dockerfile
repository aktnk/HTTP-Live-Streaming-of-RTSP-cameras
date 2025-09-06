FROM jrottenberg/ffmpeg:5.1-ubuntu

# Install dos2unix to fix carriage return issues
RUN apt-get update && apt-get install -y dos2unix && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --home-dir /home/ffmpeg ffmpeg
WORKDIR /home/ffmpeg

COPY convert.sh .
# Fix carriage returns and set permissions
RUN chmod +x convert.sh \
    && chown ffmpeg:ffmpeg convert.sh

USER ffmpeg

ENTRYPOINT ["/home/ffmpeg/convert.sh"]

