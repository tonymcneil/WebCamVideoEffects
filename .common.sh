#!/usr/bin/env bash

REAL_CAM=$(v4l2-ctl --list-devices | grep -A 1 "Integrated Camera:" | tail -1 | tr -d "\t")
VIRTUAL_CAM=/dev/$(ls -1 /sys/devices/virtual/video4linux)
