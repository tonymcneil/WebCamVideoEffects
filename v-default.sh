#!/usr/bin/env bash

source .common.sh

ffmpeg -i $REAL_CAM -f v4l2 -vcodec rawvideo -pix_fmt yuv420p $VIRTUAL_CAM >/dev/null 2>&1 &