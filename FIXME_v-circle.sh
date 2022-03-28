#!/usr/bin/env bash

source .common.sh

./kill-all.sh
ffmpeg -loop 1 -re -i media/transparent-circle.png -f v4l2 -vcodec rawvideo -pix_fmt yuv420p $VIRTUAL_CAM >/dev/null 2>&1 &


./kill-all.sh
ffmpeg -i $REAL_CAM -vf "frei0r=filter_name=pixeliz0r" -f v4l2 -vcodec rawvideo -pix_fmt yuv420p $VIRTUAL_CAM  >/dev/null 2>&1 &

ffmpeg -i $REAL_CAM -i media/transparent-circle.png -filter_complex \
    "overlay=format=auto" \
     -f v4l2 $VIRTUAL_CAM

ffmpeg -y -i video.mp4 -i overlay.png -filter_complex [0]overlay=x=0:y=0[out] -map [out] -map 0:a? test.mp4

ffmpeg -y -i $REAL_CAM \
  -i media/transparent-circle.png \
  -filter_complex "[0]overlay=x=0:y=0[out]" -map "[out]" -map "0:a?" $VIRTUAL_CAM

ffmpeg -i $REAL_CAM -i media/transparent-circle.png -filter_complex "overlay" -f v4l2 -pix_fmt yuv420p $VIRTUAL_CAM