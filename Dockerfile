FROM debian:latest

ARG USER=kai
ARG NAME="KaiG"
ARG EMAIL=kai.gatzweiler@gmail.com

ENV USER=$USER \
    HOME=/home/$USER \
    SHELL=/home/linuxbrew/.linuxbrew/bin/fish \
    HEADLESS=true

RUN apt-get update \
    && apt-get install --yes sudo curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --shell $SHELL --groups sudo --create-home --home-dir $HOME $USER \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chown -R $USER $HOME

USER $USER

WORKDIR $HOME

COPY --chown=$USER . .

RUN mkdir ~/.ssh && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
RUN ./install.sh

ENTRYPOINT [ "/home/linuxbrew/.linuxbrew/bin/fish", "--login" ]
