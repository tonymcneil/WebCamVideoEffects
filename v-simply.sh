#!/usr/bin/env bash

source .common.sh
ffmpeg -loop 1 -re -i media/One-Does-Not-Simply.jpg -f v4l2 -vcodec rawvideo -pix_fmt yuv420p $VIRTUAL_CAM >/dev/null 2>&1 &
