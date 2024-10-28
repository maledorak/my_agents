FROM docker.io/python:3.12-slim

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
    sudo \
    pipx \
    git && \
    apt-get clean

ENV USERNAME=aider
ENV HOME=/home/$USERNAME
ENV PATH=/home/$USERNAME/.local/bin:$PATH
ENV REPO_DIR=/app/repo
ENV READ_DIR=/app/read
ENV LOGS_DIR=/app/logs

RUN useradd -m -s /bin/bash -d $HOME $USERNAME
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN mkdir -p $REPO_DIR $READ_DIR $LOGS_DIR && \
    chown -R $USERNAME:$USERNAME $REPO_DIR $READ_DIR $LOGS_DIR

USER $USERNAME
RUN git config --global --add safe.directory $REPO_DIR

WORKDIR $REPO_DIR

# aider options
ENV AIDER_SUGGEST_SHELL_COMMANDS=false
ENV AIDER_CHECK_UPDATE=false
ENV AIDER_AUTO_TEST=false
ENV AIDER_AUTO_LINT=false
ENV AIDER_STREAM=false
ENV AIDER_PRETTY=false
ENV AIDER_SKIP_SANITY_CHECK_REPO=true
ENV AIDER_MAP_TOKENS=0
ENV AIDER_YES_ALWAYS=true
ENV AIDER_INPUT_HISTORY_FILE=$LOGS_DIR/.aider.input.history.md
ENV AIDER_CHAT_HISTORY_FILE=$LOGS_DIR/.aider.chat.history.md
ENV AIDER_LLM_HISTORY_FILE=$LOGS_DIR/.aider.llm.history.md

# Install aider
ARG AIDER_VERSION=v0.60.1
RUN pipx install aider-chat==${AIDER_VERSION}

COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
