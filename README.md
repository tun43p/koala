# Koala

An amazing bug bounty toolkit for Docker written in Bash.

## Table of contents

- [Koala](#koala)
  - [Table of contents](#table-of-contents)
  - [Instructions](#instructions)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Utilisation](#utilisation)
      - [Start Koala for the first time](#start-koala-for-the-first-time)
      - [After the first time](#after-the-first-time)
      - [User informations](#user-informations)
      - [Shared directory](#shared-directory)
  - [Tools](#tools)
  - [Tasks](#tasks)
  - [Versioning](#versioning)
  - [Authors](#authors)
  - [License](#license)

## Instructions

> It is obvious that this tool MUST NOT be used in a malicious context. It should only be used against your own machine or with the consent of the owner of the targeted machine. The author of **Koala** can in no way be held responsible for any malicious and unauthorized use of this script.

### Prerequisites

- A Unix-like operating system: macOS, Linux, BSD. On Windows: WSL is preferred, but cygwin or msys also mostly work.
- Docker should be installed. If is not installed, check the following instructions here: [Docker Install](https://docs.docker.com/install/)

### Installation

```bash
git clone https://github.com/tun43p/koala.git
```

### Utilisation

- `koala -b` : Build
- `koala -e` : Edit Dockerfile
- `koala -h` : Print help
- `koala -k` : Kill containers
- `koala -r` : Remove container
- `koala -R` : Remove container and images
- `koala -s` : Start Koala toolkit
- `koala -u` : Upgrade Koala
- `koala -v` : Print current version

#### Start Koala for the first time

```bash
cd ./koala
chmod +x koala.sh
./koala.sh -h # Show help
./koala.sh -b # Build Docker image
./koala.sh -s # Start Koala toolkit
```

#### After the first time

```bash
cd ./koala
./koala.sh -s # Start Koala toolkit
```

#### User informations

- **Username**: `koala`
- **Password**: `koala`

#### Shared directory

The shared directory is located in `/home/koala/shared`

## Tools

- [altdns](https://github.com/infosec-au/altdns)
- [aircrack-ng](https://github.com/aircrack-ng/aircrack-ng)
- [amass](https://github.com/OWASP/Amass)
- [awscli](https://github.com/aws/aws-cli)
- [commix](https://github.com/commixproject/commix)
- [curl](https://github.com/curl/curl)
- [dmitry](https://github.com/jaygreig86/dmitry)
- [dnsenim](https://github.com/fwaeytens/dnsenum)
- [dnsutils](https://packages.debian.org/fr/jessie/dnsutils)
- [exploitdb](https://github.com/offensive-security/exploitdb)
- [exploitdb-bin-sploits](https://github.com/offensive-security/exploitdb-bin-sploits)
- [ftp](https://packages.debian.org/jessie/ftp)
- [gcc](https://packages.debian.org/jessie/gcc)
- [hashcat](https://github.com/hashcat/hashcat)
- [hydra](https://github.com/ory/hydra)
- [john](https://github.com/magnumripper/JohnTheRipper)
- [libldns-dev](https://packages.debian.org/sid/libldns-dev)
- [make](https://packages.debian.org/buster/make)
- [masscan](https://github.com/robertdavidgraham/masscan)
- [massdns](https://github.com/blechschmidt/massdns)
- [metasploit-framework](https://github.com/rapid7/metasploit-framework)
- [net-tools](https://packages.debian.org/stretch/net-tools)
- [nikto](https://github.com/sullo/nikto)
- [netcat](https://packages.debian.org/jessie/netcat)
- [nmap](https://github.com/nmap/nmap)
- [php](https://github.com/php)
- [python3](https://www.python.org/)
- [python-pip](https://www.python.org/)
- [python3-pip](https://www.python.org/)
- [recon-ng](https://github.com/lanmaster53/recon-ng)
- [responder](https://github.com/lgandx/Responder/)
- [seclists](https://github.com/danielmiessler/SecLists)
- [sublist3r](https://github.com/aboul3la/Sublist3r)
- [sqlmap](https://github.com/sqlmapproject/sqlmap)
- [teh_s3_bucketeers](https://github.com/tomdev/teh_s3_bucketeers)
- [unicorn](http://www.unicornscan.org/)
- [vim](https://github.com/vim/vim)
- [wfuzz](https://github.com/xmendez/wfuzz)
- [wget](https://github.com/mirror/wget)
- [whois](https://github.com/weppos/whois)
- [wpscan](https://github.com/wpscanteam/wpscan)
- [wordlists](https://tools.kali.org/password-attacks/wordlists)
- [xsstrike](https://github.com/s0md3v/XSStrike)

## Tasks

- [ ] Convert Bash script to Rust script.

## Versioning

- 1.0.3

## Authors

- **tun43p** - _Initial work_ - [tun43p](https://github.com/tun43p).

## License

This project is licensed under the MIT License, see the [LICENCE](LICENSE) file for details.
