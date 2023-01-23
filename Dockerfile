FROM ubuntu:latest

# Update system, install packages from Ubuntu repositories
RUN apt-get update && apt-get full-upgrade -y && apt-get install -y \
  # Core
  locales sudo tmux unzip vim zip \
  # Networking
  curl ftp iputils-ping net-tools openvpn ssh telnet \
  # Languages
  python3 python3-pip \
  # Scanning
  nmap \
  # Brute-forcing
  hydra-gtk \
  # Clean package lists
  && rm -rf /var/lib/apt/lists/*

# Setup locales
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Install Go from Google repositories
RUN curl https://dl.google.com/go/go1.19.5.linux-amd64.tar.gz --output go.tar.gz \
  && rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz && rm go.tar.gz

# Install packages from Python repositories
RUN pip install \ 
  # Scanning
  pwncat-cs

# Create user, set user password and create or import folders
RUN useradd -rm -d /home/koala -s /bin/bash -G sudo koala
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'koala:koala' | chpasswd
COPY config/ /home/koala/
RUN chmod -R 777 /home/koala

# Set user and workdir
USER koala
WORKDIR /home/koala

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install packages from Go repositories
ENV GOPATH /home/koala/.go
RUN /usr/local/go/bin/go install \
  # Brute-forcing
  github.com/OJ/gobuster/v3@latest
