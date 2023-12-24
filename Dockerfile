FROM python:VERSION
RUN apt-get update

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

COPY ./requirements.txt /docker/requirements.txt

RUN pip install -r /docker/requirements.txt

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME}

USER ${USERNAME}
