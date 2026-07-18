#!/bin/sh
set -e

mkdir -p /app/hls

exec ffmpeg \
-i "http://www.r56mail.bingo:80/jpellat/e6khqnE/112591" \
-c copy \
-f hls \
-hls_time 4 \
-hls_list_size 5 \
-hls_flags delete_segments \
/app/hls/index.m3u8
