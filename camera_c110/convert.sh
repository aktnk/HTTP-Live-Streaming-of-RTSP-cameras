#!/bin/ash
set -e

exec ffmpeg -re -rtsp_transport tcp -i "rtsp://asdfghjkl:1234567890@192.168.0.120:554/stream2" -c:v libx264 -b:v 512k -r 15 -x264-params keyint=30:scenecut=0 -c:a aac -ar 11025 -f flv "${RTMP_SERVER_URL}/${STREAM_NAME}"