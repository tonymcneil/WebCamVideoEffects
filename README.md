# WebCamVideoEffects

This project is a guide for creating a video loopback device which can be used to stream video effects in Teams, Zoom, or any other video confrencing app that uses a web cam.

## v4l2loopback automated install steps

    # package install
    apt-get install v4l2loopback-dkms

## v4l2loopback manual install steps

    git clone git@github.com:umlaeute/v4l2loopback.git
    pushd v4l2loopback
    
    # clean previous builds
    make clean

    # build
    sudo make

    # install
    sudo make install
    sudo cp v4l2loopback.ko /lib/modules/$(uname -r)

## post install config steps

    sudo depmod -a
    sudo modprobe v4l2loopback

    # list device
    v4l2-ctl --list-devices

    # get dummy camera device into a env var
    export VIRTUAL_CAM=/dev/$(ls -1 /sys/devices/virtual/video4linux)
    # or..
    # export VIRTUAL_CAM=$(v4l2-ctl --list-devices | grep -A 1 "Dummy" | tail -1 | tr -d "\t")

    # loading module after reboot (saves doing the modprobe command after each reboot)
    sudo echo "v4l2loopback" > /etc/modules-load.d/v4l2loopback.conf 

## install frei0r video filters

    sudo apt install -y frei0r-plugins

## running effects

The default pattern for all video effects in the background is to name the script vid-${effect-name}.sh

    # e.g. display static image of "one does not simply..." meme
    ./vid-simply.sh

## killing effects

Killing all running effects:

    ./kill-all.sh