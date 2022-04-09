#!/usr/bin/env bash

source .common.sh

./kill-all.sh
ffmpeg -i $REAL_CAM -vf "frei0r=filter_name=cartoon" -f v4l2 -vcodec rawvideo -pix_fmt yuv420p $VIRTUAL_CAM  >/dev/null 2>&1 &
