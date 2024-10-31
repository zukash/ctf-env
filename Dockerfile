FROM ubuntu:22.04
ENV TZ=Asia/Tokyo
ENV PATH="/root/.cargo/bin:$PATH"
RUN apt-get update && apt-get install -y tzdata
RUN apt-get update && apt-get install -y \
    # Basic
    git \
    gdb \
    vim \
    curl \
    netcat \
    pkg-config \
    libssl-dev \
    liblzma-dev \
    lib32z1 \
    file \
    zip \
    tmux \
    gdbserver \
    rubygems \
    wget \
    # Forensics
    exiftool \
    foremost \
    # Python
    python3-dev \
    python3-pip \
    python-is-python3 \
    # Pwnable
    patchelf \
    # Ruby
    ruby-dev

# Python
RUN pip install \
    pycryptodome \
    pwntools \
    angr

# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN cargo install pwninit

# pwndbg
RUN git clone https://github.com/pwndbg/pwndbg \
    && cd pwndbg \
    && ./setup.sh

# secomp-tools & one_gadget
RUN gem install seccomp-tools one_gadget

# starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y
RUN echo 'eval "$(starship init bash)"' >> ~/.bashrc

# radare2
RUN git clone https://github.com/radareorg/radare2 \
    && radare2/sys/install.sh
RUN echo 'alias gdb="LC_CTYPE=C.UTF-8 gdb"' >> ~/.bashrc

# tmux
RUN echo "set -g prefix C-j" >> ~/.tmux.conf && \
    echo "unbind C-b" >> ~/.tmux.conf
