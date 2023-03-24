FROM texlive/texlive:latest-small

# Define arguments
ARG USER_NAME=jhordyess
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Update and install dependencies
RUN apt-get update --no-install-recommends && \
  apt-get upgrade -y && \
  apt-get autoremove --purge -y && \ 
  apt-get install -y sudo && \
  # Oh My Zsh dependencies
  apt-get install -y zsh openssh-client

# Add non-root user and grant sudo privileges
# Source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
RUN groupadd --gid $USER_GID $USER_NAME && \
  useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME && \
  echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME && \
  chmod 0440 /etc/sudoers.d/$USER_NAME

# Install latexindent and link it to /usr/local/bin
RUN tlmgr install latexindent
RUN sh -c "ln -s /usr/local/texlive/2022/texmf-dist/scripts/latexindent/latexindent.pl /usr/local/bin/latexindent"

# Switch to non-root user
USER ${USER_NAME}

# Install Zsh and plugins
# Source: https://github.com/deluan/zsh-in-docker
RUN sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
  -p git \
  -p https://github.com/zsh-users/zsh-syntax-highlighting \
  -p https://github.com/zsh-users/zsh-autosuggestions

WORKDIR /home/${USER_NAME}

# Set the default command to launch Zsh
CMD [ "zsh" ]