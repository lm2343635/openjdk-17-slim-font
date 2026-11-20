FROM eclipse-temurin:17.0.21.1_2-jre-jammy

# Adoptium November 2026 CSPU fixes CVE-2026-114938.
RUN java -XshowSettings:properties -version 2>&1 \
    | grep -F "java.runtime.version = 17.0.21.1+2"

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
