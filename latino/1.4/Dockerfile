# Dockerfile for development purposes in VSCode
# Image: Lenguaje Latino 1.4 core with Git, Zsh and Oh My Zsh; default user: jhordyess
# Author: Jhordy Gavinchu
# Docker Hub: https://hub.docker.com/r/jhordyess/latino
# All sources were reviewed on February 19, 2024

# Use the Ubuntu 22.04 base image
FROM ubuntu:22.04

# Define arguments for user configuration and PATH to Lenguaje Latino installation directory
ARG USER_NAME=jhordyess
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG LATINO_PATH="/home/${USER_NAME}/.latino"

# Update and install dependencies
RUN apt-get update --no-install-recommends && \
  apt-get upgrade -y && \
  apt-get autoremove --purge -y && \
  apt-get install -y sudo && \
  # Install Oh My Zsh dependencies
  apt-get install -y git curl zsh && \
  # Install Lenguaje Latino dependecies
  apt-get install -y cmake build-essential libreadline-dev libpthread-stubs0-dev

# Add a non-root user and grant sudo privileges
# Source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
RUN groupadd --gid $USER_GID $USER_NAME && \
  useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME && \
  echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME && \
  chmod 0440 /etc/sudoers.d/$USER_NAME

# Install Lenguaje Latino
# Source: https://manual.lenguajelatino.org/es/stable/OS/Debian-Ubuntu.html#instalacion-manual
RUN git clone https://github.com/lenguaje-latino/latino-core ${LATINO_PATH} && \
  cmake -S ${LATINO_PATH} -B ${LATINO_PATH} && \
  make -C ${LATINO_PATH} install

# Switch to the non-root user
USER ${USER_NAME}

# Install Zsh and plugins
# Source: https://github.com/deluan/zsh-in-docker#examples
RUN sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
  -p git \
  -p https://github.com/zsh-users/zsh-syntax-highlighting \
  -p https://github.com/zsh-users/zsh-autosuggestions

# Set the default working directory
WORKDIR /home/${USER_NAME}

# Set the default command to launch Lenguaje Latino
CMD [ "latino" ]