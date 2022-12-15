FROM python:3
ARG USER_NAME=jhordyess
ARG USER_UID=1000
ARG USER_GID=$USER_UID
# Update
RUN apt-get update --no-install-recommends \
  && apt-get upgrade -y \
  && apt-get autoremove --purge -y
# Add noon-root user, source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
RUN groupadd --gid $USER_GID $USER_NAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME
RUN apt-get install -y sudo \
  && echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME \
  && chmod 0440 /etc/sudoers.d/$USER_NAME
#
RUN apt-get install -y zsh
USER ${USER_NAME}
#? https://github.com/deluan/zsh-in-docker
RUN sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
  -p git \
  -p https://github.com/zsh-users/zsh-syntax-highlighting \
  -p https://github.com/zsh-users/zsh-autosuggestions
WORKDIR /home/${USER_NAME}
RUN echo "alias update='sudo apt-get update --no-install-recommends;sudo apt-get upgrade -y;sudo apt-get autoremove --purge -y'" >> ~/.zshrc
RUN echo "alias nosave='clear;history -c'" >> ~/.zshrc
# PlatformIO
#? https://docs.platformio.org/en/latest/core/installation/methods/installer-script.html
ENV PATH="/home/${USER_NAME}/.platformio/penv/bin:${PATH}"
RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/master/scripts/get-platformio.py)"
CMD [ "zsh" ]