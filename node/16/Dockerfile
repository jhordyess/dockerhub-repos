FROM node:16
ARG USER_NAME=node
# Update
RUN apt-get update --no-install-recommends \
  && apt-get upgrade -y \
  && apt-get autoremove --purge -y
RUN apt-get install -y sudo \
  && echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME \
  && chmod 0440 /etc/sudoers.d/$USER_NAME
# Set locale and timezone
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y locales locales-all tzdata
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.en
ENV TZ=America/La_Paz
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