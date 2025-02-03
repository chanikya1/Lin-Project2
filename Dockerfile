FROM ubuntu:latest

# Install required system packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PyYAML using pip3 (correct way)
RUN pip3 install --no-cache-dir PyYAML

# Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
