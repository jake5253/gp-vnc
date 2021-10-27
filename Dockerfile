FROM gitpod/workspace-full-vnc
USER ROOT
# Install dependencies
RUN apt-get update \
    && apt-get install -y libgtk-3-dev \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
