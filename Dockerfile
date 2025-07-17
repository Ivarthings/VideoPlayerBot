FROM debian:latest

# Install dependencies for building Python and general tools
RUN apt update && apt upgrade -y && \
    apt install -y \
    git \
    wget \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libgdbm-dev \
    libdb5.3-dev \
    libbz2-dev \
    libexpat1-dev \
    liblzma-dev \
    tk-dev \
    ffmpeg

# Install Python 3.9.2 from source
WORKDIR /usr/src
RUN wget https://www.python.org/ftp/python/3.9.2/Python-3.9.2.tgz && \
    tar xzf Python-3.9.2.tgz && \
    cd Python-3.9.2 && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall

# Create work directory
RUN mkdir /safone/
WORKDIR /safone/
COPY . /safone/

# Upgrade pip and install requirements
RUN python3.9 -m pip install --upgrade pip
RUN python3.9 -m pip install -U -r requirements.txt

# Run the application
CMD ["python3.9", "main.py"]
