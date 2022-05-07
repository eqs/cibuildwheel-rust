FROM rust:latest

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt update &&\
    rm -rf ~/.cache &&\
    apt clean all &&\
    apt install -y cmake &&\
    apt install -y clang
RUN apt install -y build-essential git

# install python
ENV HOME="/root"
ENV PYENV_ROOT="$HOME/.pyenv"
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"
RUN git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN eval "$(pyenv init -)"
RUN pyenv install 3.8.13
RUN pyenv global 3.8.13

RUN mkdir -p /opt/python/cp38-cp38
RUN ln -s "$PYENV_ROOT/shims" /opt/python/cp38-cp38/bin

WORKDIR /app

# ENTRYPOINT ["/bin/bash"]
