FROM ubuntu:latest

RUN apt-get update && apt full-upgrade

# Update system and install modules from Ubuntu repositories
RUN apt-get install -y \
  # 1. Core modules 
  build-essential locales sudo tmux unzip vim zip \
  # 2. Networking
  curl dnsutils ftp iputils-ping netcat net-tools openvpn ssh telnet wget \
  # 3. Languages
  golang perl python3 python3-pip \
  # 4. Scanning
  dnsenum nmap \
  # 5. Brute-forcing
  hydra-gtk \
  # Clean package lists
  && rm -rf /var/lib/apt/lists/*

# Setup locales
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Install Python modules
RUN pip install \ 
  # 6. Reverse shell
  pwncat-cs

# Create user
RUN useradd -rm -d /home/koala -s /bin/bash -G sudo koala
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'koala:koala' | chpasswd

# Import config folder
COPY config/ /home/koala/
RUN chmod -R 777 /home/koala

# Set user and workdir
USER koala
WORKDIR /home/koala

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Go modules
ENV GOPATH /home/koala/.go
RUN \
  # 1. Scanning
  go install github.com/ffuf/ffuf@latest; \
  # 5. Brute-forcing
  go install  github.com/OJ/gobuster/v3@latest
