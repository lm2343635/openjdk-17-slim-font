FROM eclipse-temurin:17-jre-jammy

RUN sed -i 's/main/main contrib non-free/' /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    fonts-arphic-ukai \
    fonts-arphic-uming \
    fonts-noto-cjk \
    fonts-wqy-zenhei \
    fonts-wqy-microhei \
    ghostscript \
    --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
