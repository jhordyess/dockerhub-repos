# Dockerfile for development purposes in VSCode
# Image: TexLive 2025 (small) with Git, Zsh and Oh My Zsh; default user: jhordyess
# Author: Jhordy Gavinchu
# Docker Hub: https://hub.docker.com/r/jhordyess/texlive
# All sources were reviewed on May 30, 2025

# Use the latest TexLive 2025 (small) base image
FROM texlive/texlive:latest-small

# Define arguments for user configuration
ARG DEFAULT_USER_NAME=texlive
ARG DEFAULT_GROUP_NAME=${DEFAULT_USER_NAME}
ARG USER_NAME=jhordyess

# Update and install dependencies
RUN apt update --no-install-recommends && \
  apt upgrade -y && \
  apt autoremove --purge -y && \ 
  apt install -y sudo \
  # Install Oh My Zsh dependencies
  git wget zsh \
  # Install SSH client to support remote git repositories
  openssh-client

# Modify the default user and group names
RUN usermod -l $USER_NAME -d /home/$USER_NAME -m $DEFAULT_USER_NAME && \
  groupmod -n $USER_NAME $DEFAULT_GROUP_NAME

# Grant sudo privileges
# Source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
RUN echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME && \
  chmod 0440 /etc/sudoers.d/$USER_NAME

# Install latexindent and latexmk for use with the VSCode LaTeX Workshop extension.
# Create symbolic links to make them available in /usr/local/bin
RUN tlmgr update --self && \
  tlmgr install latexindent latexmk && \
  ln -s /usr/local/texlive/2025/texmf-dist/scripts/latexindent/latexindent.pl /usr/local/bin/latexindent && \
  ln -s /usr/local/texlive/2025/texmf-dist/scripts/latexmk/latexmk.pl /usr/local/bin/latexmk

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
