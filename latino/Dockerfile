FROM ubuntu:latest

# Define arguments
ARG USER_NAME=jhordyess
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
ARG LATINO_PATH="/home/${USER_NAME}/.latino"

# Update and install dependencies
RUN apt-get update --no-install-recommends && \
  apt-get upgrade -y && \
  apt-get autoremove --purge -y && \
  apt-get install -y sudo && \
  # Oh My Zsh dependencies
  apt-get install -y git curl zsh && \
  # Latino dependecies
  apt-get install -y cmake build-essential libreadline-dev libpthread-stubs0-dev

# Add non-root user and grant sudo privileges
# Source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
RUN groupadd --gid $USER_GID $USER_NAME && \
  useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME && \
  echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME && \
  chmod 0440 /etc/sudoers.d/$USER_NAME

# Install Latino
# Source: https://manual.lenguajelatino.org/es/stable/OS/Debian-Ubuntu.html
RUN git clone https://github.com/lenguaje-latino/latino-core ${LATINO_PATH} \
  && cmake -S ${LATINO_PATH} -B ${LATINO_PATH} \
  && make -C ${LATINO_PATH} install

# Switch to non-root user
USER ${USER_NAME}

# Install Zsh and plugins
# Source: https://github.com/deluan/zsh-in-docker
RUN sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
  -p git \
  -p https://github.com/zsh-users/zsh-syntax-highlighting \
  -p https://github.com/zsh-users/zsh-autosuggestions

WORKDIR /home/${USER_NAME}

# Set the default command to launch Latino
CMD [ "latino" ]