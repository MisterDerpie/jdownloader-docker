FROM debian:buster

# Install git, supervisor, VNC, & X11 packages, JRE, wget
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      fluxbox \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      xvfb \
      openjdk-11-jre \
      wget \
      procps
# Cleanup
RUN apt-get clean
# Get JDownloader 2
RUN wget http://installer.jdownloader.org/JDownloader.jar
# Initial run, generate configs
RUN java -jar -Djava.awt.headless=true JDownloader.jar

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768

EXPOSE 8080
VOLUME /Downloads
VOLUME /Extracted
VOLUME /cfg
VOLUME /containers

COPY /jdownloader /
COPY /app /app
CMD ["/app/entrypoint.sh"]