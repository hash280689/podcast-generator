FROM python:3.10-slim

RUN apt-get update && apt-get install -y git \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh /usr/bin/feed.py

ENTRYPOINT ["/entrypoint.sh"]