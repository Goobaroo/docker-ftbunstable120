# syntax=docker/dockerfile:1

FROM openjdk:17.0.2-jdk-buster

LABEL version="1.5.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Unstable 1.20: Forge"
LABEL homepage.icon="https://apps.modpacks.ch/modpacks/art/104/unstableforge512x512.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTB-Unstable-1.20-Forge:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Unstable 1.20: Forge v1.5.0 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]