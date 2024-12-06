# Dockerfile for development purposes in VSCode
# Image: Java 17 with Maven 3, Git, Zsh and Oh My Zsh; default user: jhordyess
# Author: Jhordy Gavinchu
# Docker Hub: https://hub.docker.com/r/jhordyess/java
# All sources were reviewed on December 6, 2024

# Use the Maven 3 with Java 17 base image from Eclipse Temurin
FROM maven:3-eclipse-temurin-17

# Define arguments for user configuration
ARG DEFAULT_USER_NAME=ubuntu
ARG USER_NAME=jhordyess

# Update and install dependencies
RUN apt-get update --no-install-recommends && \
  apt-get upgrade -y && \
  apt-get autoremove --purge -y && \ 
  apt-get install -y sudo && \
  # Install Oh My Zsh dependencies
  apt-get install -y git wget zsh

# Rename the default user, note that the 1000 GUID is also "ubuntu"
RUN usermod -l $USER_NAME -d /home/$USER_NAME -m $DEFAULT_USER_NAME

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

# Set the default command to launch Java Shell
CMD [ "jshell" ]