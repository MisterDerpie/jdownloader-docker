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

# Configuration

The container exposes the following port and volumes.

| Type   | Value         | Description                                  |
|--------|---------------|----------------------------------------------|
| Port   | `8080`        | Port to access the UI at `8080/vnc.html`     |
| Volume | `/Downloads`  | Directory where downloaded files are stored. |
| Volume | `/Extracted`  | Directory where extracted files are stored.  |
| Volume | `/cfg`        | JDownloader's Configuration location.        |
| Volume | `/containers` | Directory for container files.               |

A default JDownloader configuration can be found at `jdownloader/cfg/`.
It changes the download as well as the extract location.
Moreover it is configured to delete files after extraction.
To extend the configuration, or take your own, you can either map your configuration directory as a volume or copy your content in the `/cfg` directory at image creation time.
The `/containers` volume is there to give the possibility of uploading an e.g. DLC container on your host machine and opening it from JDownloader.

# Launching

Assuming the image is named `jd2-base`, you can launch the container as follows.

```bash
docker container run -d \
    -p 8080:8080 \
    -v "$(pwd)/Downloads":/Downloads \
    -v "$(pwd)/Extracted":/Extracted \
    -v "$(pwd)/containers":/containers \
    -v "$(pwd)/cfg":/cfg \
    --name jdownloader \
    jd2-base
```

You can access JDownloader via [localhost:8080/vnc.hmtl].

# License

The browser-novnc setup is based on [GitHub/theasp/docker-novnc](https://github.com/theasp/docker-novnc), which was released under MIT.
A copy of the license is found at `LICENSE_DOCKER_NOVNC`.