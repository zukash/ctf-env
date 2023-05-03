FROM ubuntu:20.04
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
    # Python
    python3-dev \
    python3-pip \
    python-is-python3 \
    # Pwnable
    patchelf
# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
# Crypto
RUN pip install pycryptodome
# Pwnable
RUN pip install pwntools
RUN cargo install pwninit
RUN git clone https://github.com/longld/peda.git ~/peda \
    && echo "source ~/peda/peda.py" >> ~/.gdbinit
