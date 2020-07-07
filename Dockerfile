FROM openjdk:11.0-jre-slim

ENV VERSION="1.15.2"

ADD paper.sh .
RUN apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

CMD ["sh", "./paper.sh"]

EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /data
