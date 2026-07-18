#!/bin/sh

mkdir -p /app/hls

ffmpeg -re -i "https://restpdmqtest2only-production.up.railway.app/memfs/0ac7e015-6376-47d8-9443-45e1fe530683.m3u8" \
-c copy \
-f hls \
-hls_time 4 \
-hls_list_size 5 \
-hls_flags delete_segments \
/app/hls/index.m3u8

python3 -m http.server 8080 -d /app/hls
