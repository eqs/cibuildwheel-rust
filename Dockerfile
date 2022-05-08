# FROM dockcross/manylinux-x64
FROM quay.io/pypa/manylinux2014_x86_64:latest

ENV RUST_VERSION stable
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- -y --default-toolchain ${RUST_VERSION}
ENV PATH $PATH:$HOME/.cargo/bin
