#! No longer maintained, last update was: December, 2024

# Dockerfile for development purposes in VSCode
# Image: Node 22 with Git, Zsh and Oh My Zsh; default user: jhordyess
# Author: Jhordy Gavinchu
# Docker Hub: https://hub.docker.com/r/jhordyess/node
# All sources were reviewed on December 6, 2024

# Use the Node 22 base image
FROM node:22

# Define arguments for user configuration
ARG DEFAULT_USER_NAME=node
ARG USER_NAME=jhordyess

# Update and install dependencies
RUN apt-get update --no-install-recommends && \
  apt-get upgrade -y && \
  apt-get autoremove --purge -y && \ 
  apt-get install -y sudo && \
  # Install Oh My Zsh dependencies
  apt-get install -y git wget zsh

# Change the default user "node" to "jhordyess"
# Source: https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#non-root-user
# Rename the default user, note that the 1000 GUID is also "node"
RUN usermod -l $USER_NAME -d /home/$USER_NAME -m $DEFAULT_USER_NAME

# Grant sudo privileges, the user already exists
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

# Set the default command to launch Node
CMD [ "node" ]