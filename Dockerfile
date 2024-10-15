FROM openjdk:17-jdk-slim

RUN apt-get update && apt-get install -y \
    fonts-arphic-ukai \
    fonts-arphic-uming \
    fonts-noto-cjk \
    fonts-wqy-zenhei \
    fonts-wqy-microhei \
    ttf-mscorefonts-installer \
    ghostscript \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
