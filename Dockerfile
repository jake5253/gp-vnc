FROM gitpod/workspace-full-vnc

# Install dependencies
RUN sudo apt update \
    && sudo apt install -y libgtk-3-dev
