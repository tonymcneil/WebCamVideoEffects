#!/usr/bin/env bash

source .common.sh

# ffmpeg -i $REAL_CAM -vf "frei0r=filter_name=pixeliz0r:filter_params=0.02|0.02" -f v4l2 -vcodec rawvideo -pix_fmt yuv420p $VIRTUAL_CAM  >/dev/null 2>&1 &

ffmpeg -i $REAL_CAM -vf "frei0r=filter_name=pixeliz0r" -f v4l2 -vcodec rawvideo -pix_fmt yuv420p $VIRTUAL_CAM  >/dev/null 2>&1 &