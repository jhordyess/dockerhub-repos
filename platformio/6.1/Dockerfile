# Dockerfile for development purposes in VSCode
# Image: PlatformIO Core 6.1 with Python, Git, Zsh, and Oh My Zsh; default user: jhordyess
# Author: Jhordy Gavinchu
# Docker Hub: https://hub.docker.com/r/jhordyess/platformio
# All sources were reviewed on September 7, 2023

# Use the Python 3 base image
FROM python:3

# Define arguments for user configuration
ARG USER_NAME=jhordyess
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Update and install dependencies
RUN apt-get update --no-install-recommends && \
  apt-get upgrade -y && \
  apt-get autoremove --purge -y && \ 
  apt-get install -y sudo && \
  # Install Oh My Zsh dependencies
  apt-get install -y zsh

# Add a non-root user and grant sudo privileges
# Source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
RUN groupadd --gid $USER_GID $USER_NAME && \
  useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME && \
  echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME && \
  chmod 0440 /etc/sudoers.d/$USER_NAME

# Switch to the non-root user
USER ${USER_NAME}

# Install Zsh and plugins
# Source: https://github.com/deluan/zsh-in-docker#examples
RUN sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
  -p git \
  -p https://github.com/zsh-users/zsh-syntax-highlighting \
  -p https://github.com/zsh-users/zsh-autosuggestions

# Install PlatformIO and add it to the PATH
# Source: https://docs.platformio.org/en/latest/core/installation/methods/installer-script.html#super-quick-macos-linux
ENV PATH="/home/${USER_NAME}/.platformio/penv/bin:${PATH}"
RUN curl -fsSL -o /home/${USER_NAME}/get-platformio.py 'https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py' && \
  python3 /home/${USER_NAME}/get-platformio.py && \
  rm /home/${USER_NAME}/get-platformio.py

# Set the default working directory
WORKDIR /home/${USER_NAME}

# Set the default command to launch PlatformIO
CMD [ "pio" ]
