# TODO(tun43p): Install Git submodules directly on the system

FROM ubuntu:latest

# Set display environment variable
ENV DISPLAY=host.docker.internal:0.0

# Update, upgrade and install modules from Ubuntu repositories
RUN apt update && apt full-upgrade -y && apt install -y \
  # 1. Core modules 
  build-essential git locales neovim sudo tmux unzip zip \
  # 2. Languages
  default-jre golang libapache2-mod-php maven perl php python3-full pipx postgresql ruby \
  # 3. Networking
  curl dnsutils ftp iputils-ping lynx mysql* netcat-traditional net-tools openvpn python3-netifaces redis-tools smbclient ssh tcpdump telnet wget \
  # 4. Scanning
  dnsenum ncat nmap sqlmap whois \
  # 5. Brute-forcing
  hydra-gtk john \
  # Clean package lists
  && rm -rf /var/lib/apt/lists/*

# Import modules from custom repositories 
RUN wget -qO- https://pgp.mongodb.com/server-8.0.asc | gpg --dearmor | sudo tee /usr/share/keyrings/mongodb-server-8.0.gpg >/dev/null && \
  echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/8.0 multiverse" | sudo tee -a /etc/apt/sources.list.d/mongodb-org-8.0.list && \
  apt update && apt install -y mongodb-org && \
  systemctl enable mongod.service

# Install Ruby modules
RUN gem install evil-winrm

# Install modules from sources
RUN cd /opt && \
  # 3. Networking
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli && \
  rm -rf awscliv2.zip

# Setup locales
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Setup TUN device
RUN mkdir -p /dev/net && \
  mknod /dev/net/tun c 10 200 && \
  chmod 600 /dev/net/tun

# Create user
RUN useradd -rm -d /home/koala -s /bin/bash -G sudo koala
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'koala:koala' | chpasswd

# Setting up home folder
COPY config/ /home/koala/
RUN chmod -R 777 /home/koala

# Set user and workdir
USER koala
WORKDIR /home/koala

# Install Python modules with pipx
RUN pipx ensurepath && \
  # 3. Networking
  pipx install impacket && \
  # 5. Brute-forcing
  pipx install Sublist3r 

# Install Go modules
ENV GOPATH /home/koala/.go
RUN \
  # 4. Scanning
  go install github.com/ffuf/ffuf@latest; \
  # 5. Brute-forcing
  go install github.com/OJ/gobuster/v3@latest

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# TODO(tun43p): Install impacket
# TODO(tun43p): Install Responder
# TODO(tun43p): Install rogue-jndi
# TODO(tun43p): Install SecLists