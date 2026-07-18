#!/bin/sh

mkdir -p /app/hls

ffmpeg -re -i "http://qwerty65.xyz:80/47352164/fSe3AuX/112591" \
-c copy \
-f hls \
-hls_time 4 \
-hls_list_size 5 \
-hls_flags delete_segments \
/app/hls/index.m3u8

python3 -m http.server 8080 -d /app/hls
