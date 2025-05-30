# Dockerfile for development purposes in VSCode
# Image: Ubuntu 24.04 (Noble Numbat) with Git, Zsh, and Oh My Zsh; default user: jhordyess
# Author: Jhordy Gavinchu
# Docker Hub: https://hub.docker.com/r/jhordyess/ubuntu
# All sources were reviewed on May 30, 2025

# Use the Ubuntu 24.04 base image
FROM ubuntu:24.04

# Define arguments for user configuration
ARG DEFAULT_USER_NAME=ubuntu
ARG DEFAULT_GROUP_NAME=$DEFAULT_USER_NAME
ARG USER_NAME=jhordyess

# Update and install dependencies
RUN apt update --no-install-recommends && \
  apt upgrade -y && \
  apt autoremove --purge -y && \ 
  apt install -y sudo \
  # Install Oh My Zsh dependencies
  git wget zsh

# Modify the default user and group names
RUN usermod -l $USER_NAME -d /home/$USER_NAME -m $DEFAULT_USER_NAME && \
  groupmod -n $USER_NAME $DEFAULT_GROUP_NAME

# Grant sudo privileges
# Source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
RUN echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME && \
  chmod 0440 /etc/sudoers.d/$USER_NAME

# Switch to the non-root user
USER ${USER_NAME}

# Install Zsh and plugins
# Source: https://github.com/deluan/zsh-in-docker#examples
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.1/zsh-in-docker.sh)" -- \
  -p git \
  -p https://github.com/zsh-users/zsh-syntax-highlighting \
  -p https://github.com/zsh-users/zsh-autosuggestions

# Set the default working directory
WORKDIR /home/${USER_NAME}

# Set the default command to launch Zsh
CMD [ "zsh" ]