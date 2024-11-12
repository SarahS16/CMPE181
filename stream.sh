#!/bin/bash

#begin stream
echo "starting stream..."
libcamera-vid -o - -t 0 -n | cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/stream}' :demux=h264