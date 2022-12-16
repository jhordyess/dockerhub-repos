FROM ubuntu:20.04
ARG USER_NAME=jhordyess
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
ARG LATINO_PATH_AUX="/home/${USER_NAME}/.latino"
# Update
RUN apt-get update --no-install-recommends \
  && apt-get upgrade -y \
  && apt-get autoremove --purge -y
# Add noon-root user, source: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
RUN groupadd --gid ${USER_GID} ${USER_NAME} \
  && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USER_NAME}
RUN apt-get install -y sudo \
  && echo ${USER_NAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER_NAME} \
  && chmod 0440 /etc/sudoers.d/${USER_NAME}
# Set locale and timezone
ENV TZ=Universal
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
RUN apt-get install -y locales locales-all tzdata
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.en
#
RUN apt-get install -y git curl zsh
# Latino
#? https://manual.lenguajelatino.org/es/stable/OS/Debian-Ubuntu.html
RUN apt-get install -y cmake build-essential libreadline-dev libpthread-stubs0-dev
RUN git clone https://github.com/lenguaje-latino/latino-core ${LATINO_PATH_AUX}
RUN cmake -S ${LATINO_PATH_AUX} -B ${LATINO_PATH_AUX}
RUN make -C ${LATINO_PATH_AUX} install
# -
USER ${USER_NAME}
#? https://github.com/deluan/zsh-in-docker
RUN sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
  -p git \
  -p https://github.com/zsh-users/zsh-syntax-highlighting \
  -p https://github.com/zsh-users/zsh-autosuggestions
WORKDIR /home/${USER_NAME}
RUN echo "alias update='sudo apt-get update --no-install-recommends;sudo apt-get upgrade -y;sudo apt-get autoremove --purge -y'" >> ~/.zshrc
RUN echo "alias nosave='clear;history -c'" >> ~/.zshrc
CMD [ "latino" ]