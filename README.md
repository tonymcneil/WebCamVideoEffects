# WebCamVideoEffects

This project is a guide for creating a video loopback device which can be used to stream video effects in Teams, Zoom, or any other video conferencing app that uses a web cam.

Video pipeline: Hardware WebCam -> video effects/filters -> virtual video device -> video chat app (zoom/Teams).

## v4l2loopback

The video manipulation module that allows installation of a virtual video loopback device is v4l2loopback.
(see: https://github.com/umlaeute/v4l2loopback for finer details, however summary install instructions follow below).

### v4l2loopback automated install steps

    # package install (ubuntu)
    apt-get install v4l2loopback-dkms

### v4l2loopback manual install steps (alternate to automated step)

    git clone git@github.com:umlaeute/v4l2loopback.git
    pushd v4l2loopback
    
    # clean previous builds
    make clean

    # build
    sudo make

    # install
    sudo make install
    sudo cp v4l2loopback.ko /lib/modules/$(uname -r)

## other tools

    sudo apt install -y v4l-utils

### post install config steps

    sudo depmod -a
    sudo modprobe v4l2loopback

    # list devices (ensure the nde "Dummy" loopback device is present)
    v4l2-ctl --list-devices

    # loading module after reboot (saves doing the modprobe command after each reboot)
    sudo echo "v4l2loopback" > /etc/modules-load.d/v4l2loopback.conf 

## frei0r (video effects lib/plugins/api)

The main video effects that are provided in this project use the excellent frei0r project.

### frei0r plugin installation

    sudo apt install -y frei0r-plugins

## helper scripts

Helper scripts have been created to provide a curated set of effect processing pipelines.

## running effects

Video effects can be run in the background using the convention `./v-${effect-name}.sh`

    # e.g. display static image of the "one does not simply..." meme:
    ./v-simply.sh

    # e.g. stream the default real cam to the virtual cam (i.e. no effects):
    ./v-simply.sh

## killing effects

Killing all running effects:

    ./kill-all.sh