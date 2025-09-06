#!/bin/sh
set -e

# Check if RTSP_URL is set
if [ -z "$RTSP_URL" ]; then
    echo "Error: RTSP_URL environment variable not set." >&2
    exit 1
fi

# Check if RTMP_SERVER_URL and STREAM_NAME are set
if [ -z "$RTMP_SERVER_URL" ] || [ -z "$STREAM_NAME" ]; then
    echo "Error: RTMP_SERVER_URL or STREAM_NAME not set." >&2
    exit 1
fi

# Run ffmpeg without audio
exec ffmpeg -re -rtsp_transport tcp -fflags +genpts -i "$RTSP_URL" \
    -an \
    -c:v libx264 -b:v 512k -r 15 -x264-params keyint=30:scenecut=0 \
    -f flv "${RTMP_SERVER_URL}/${STREAM_NAME}"
