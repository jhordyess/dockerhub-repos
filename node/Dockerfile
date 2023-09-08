# Dockerfile for development purposes in VSCode
# Image: Node 18 with Git, Zsh and Oh My Zsh; default user: jhordyess
# Author: Jhordy Gavinchu
# Docker Hub: https://hub.docker.com/r/jhordyess/node
# All sources were reviewed on September 7, 2023

# Use the latest Node 18 base image
FROM node:18

# Define arguments for user configuration
ARG DEFAULT_USER_NAME=node
ARG USER_NAME=jhordyess

# Change the default user "node" to "jhordyess"
# Source: https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#non-root-user
RUN usermod -d /home/$USER_NAME -l $USER_NAME $DEFAULT_USER_NAME && \
  mkdir -p /home/$USER_NAME && \
  chown -R $USER_NAME:node /home/$USER_NAME

# Update and install dependencies
RUN apt-get update --no-install-recommends && \
  apt-get upgrade -y && \
  apt-get autoremove --purge -y && \ 
  apt-get install -y sudo && \
  # Install Oh My Zsh dependencies
  apt-get install -y zsh

# Grant sudo privileges, the user already exists
# Source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
RUN echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME && \
  chmod 0440 /etc/sudoers.d/$USER_NAME

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

# Set the default command to launch Node
CMD [ "node" ]