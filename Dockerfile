FROM eclipse-temurin:17-jre-jammy

# The fixed JRE is released before the corresponding official container tag.
# https://adoptium.net/news/2026/11/temurin-november-2026-cspu-java4shell
ENV JAVA_VERSION=jdk-17.0.21.1+2
RUN set -eux; \
    test "$(dpkg --print-architecture)" = amd64; \
    wget -O /tmp/jre.tar.gz 'https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.21.1%2B2/OpenJDK17U-jre_x64_linux_hotspot_17.0.21.1_2.tar.gz'; \
    echo '5a092a0bc21de4c3d855480edd7945be9cfe157b38cdb84dac280511893bb009  /tmp/jre.tar.gz' | sha256sum -c -; \
    rm -rf "$JAVA_HOME"; \
    mkdir -p "$JAVA_HOME"; \
    tar -xzf /tmp/jre.tar.gz -C "$JAVA_HOME" --strip-components=1 --no-same-owner; \
    rm /tmp/jre.tar.gz; \
    ldconfig; \
    java -XshowSettings:properties -version 2>&1 | grep -F 'java.runtime.version = 17.0.21.1+2'

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
