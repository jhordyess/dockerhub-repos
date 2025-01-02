# Dockerfile for development purposes in VSCode
# Image: TexLive 2024 (small) with Git, Zsh and Oh My Zsh; default user: jhordyess
# Author: Jhordy Gavinchu
# Docker Hub: https://hub.docker.com/r/jhordyess/texlive
# All sources were reviewed on December 6, 2024

# Use the latest TexLive 2024 (small) base image
FROM texlive/texlive:latest-small

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
  apt-get install -y git wget zsh \ 
  # Install SSH client to support remote git repositories
  openssh-client

# Add a non-root user and grant sudo privileges
# Source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
RUN groupadd --gid $USER_GID $USER_NAME && \
  useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME && \
  echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME && \
  chmod 0440 /etc/sudoers.d/$USER_NAME

# Install latexindent and latexmk for use with the VSCode LaTeX Workshop extension.
# Create symbolic links to make them available in /usr/local/bin
RUN tlmgr install latexindent latexmk && \
  ln -s /usr/local/texlive/2024/texmf-dist/scripts/latexindent/latexindent.pl /usr/local/bin/latexindent && \
  ln -s /usr/local/texlive/2024/texmf-dist/scripts/latexmk/latexmk.pl /usr/local/bin/latexmk

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
