FROM openjdk:17-jdk-slim

RUN sed -i 's/main/main contrib non-free/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    fonts-arphic-ukai \
    fonts-arphic-uming \
    fonts-noto-cjk \
    fonts-wqy-zenhei \
    fonts-wqy-microhei \
    ghostscript \
    --no-install-recommends
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*