# JDownloader Docker

This repo is to create a docker container that contains JDownloader which can be accessed via browser.
The main purpose for that is to run JDownloader on RaspberryPi 4 without relying on `MyJDownloader` but have an accessible webinterface.


# Installation

The installation requires Docker installed.
For how to install this on a Raspberry Pi 4, see `Setup on Raspberry Pi 4`.

1. Clone this repository

2. Build the docker image

```bash
docker build -t jd2-base .
```

## Raspberry Pi 4

To make this container run, you need to install `X11/xorg` and `openbox` on the Raspberry Pi.
Assuming you are on a Debian based image, install them before running a container.

```bash
sudo apt-get install -y xorg openbox
```

# License

The browser-novnc setup is based on [GitHub/theasp/docker-novnc](https://github.com/theasp/docker-novnc), which was released under MIT.
A copy of the license is found at `LICENSE_DOCKER_NOVNC`.