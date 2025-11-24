FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ca-certificates \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh /usr/bin/feed.py

ENTRYPOINT ["/entrypoint.sh"]