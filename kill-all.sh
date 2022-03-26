#!/usr/bin/env bash

pgrep ffmpeg | xargs -I {} kill {}
