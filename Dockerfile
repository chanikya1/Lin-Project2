FROM ubuntu:latest

# Install required system packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a virtual environment and install PyYAML
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir PyYAML

# Set the virtual environment as default
ENV PATH="/opt/venv/bin:$PATH"

# Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
