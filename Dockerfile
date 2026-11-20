FROM eclipse-temurin:21-jre-jammy

# The fixed JRE is released before the corresponding official container tag.
# https://adoptium.net/news/2026/11/temurin-november-2026-cspu-java4shell
ENV JAVA_VERSION=jdk-21.0.13.1+2
RUN set -eux; \
    test "$(dpkg --print-architecture)" = amd64; \
    wget -O /tmp/jre.tar.gz 'https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13.1%2B2/OpenJDK21U-jre_x64_linux_hotspot_21.0.13.1_2.tar.gz'; \
    echo '18f44fab9065217f3ba61d0eef8a7b5f3c3713aa7293001b0d4ac10ede3850f0  /tmp/jre.tar.gz' | sha256sum -c -; \
    rm -rf "$JAVA_HOME"; \
    mkdir -p "$JAVA_HOME"; \
    tar -xzf /tmp/jre.tar.gz -C "$JAVA_HOME" --strip-components=1 --no-same-owner; \
    rm /tmp/jre.tar.gz; \
    ldconfig; \
    java -XshowSettings:properties -version 2>&1 | grep -F 'java.runtime.version = 21.0.13.1+2'

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
