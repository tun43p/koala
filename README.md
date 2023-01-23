# Koala

An amazing bug bounty toolkit for Docker written in Bash.

## Table of contents

- [Koala](#koala)
  - [Table of contents](#table-of-contents)
  - [Instructions](#instructions)
  - [Prerequisites](#prerequisites)
  - [Informations](#informations)
    - [Architecture](#architecture)
    - [Packages](#packages)
  - [Getting started](#getting-started)
  - [Installation](#installation)
    - [Update Koala](#update-koala)
    - [Build Koala](#build-koala)
    - [Start Koala](#start-koala)
    - [Prune Koala](#prune-koala)
    - [User informations](#user-informations)
  - [Versioning](#versioning)
  - [Authors](#authors)
  - [License](#license)

## Instructions

> It is obvious that this tool MUST NOT be used in a malicious context. It should only be used against your own machine or with the consent of the owner of the targeted machine. The author of **Koala** can in no way be held responsible for any malicious and unauthorized use of this script.

## Prerequisites

- A Unix-like operating system: macOS, Linux, BSD. On Windows: WSL is preferred, but cygwin or msys also mostly work.
- Docker should be installed. If is not installed, check the following instructions here: [Docker Install](https://docs.docker.com/install/)

## Informations

### Architecture

To see the architecture instructions, go the the [ARCHITECTURE.md](./ARCHITECTURE.md) file.

### Packages

To see the packages list, go the the [PACKAGES.md](./PACKAGES.md) file.

## Getting started

## Installation

```bash
git clone https://github.com/tun43p/koala.git
```

### Update Koala

```bash
git checkout main && git pull origin main
```

### Build Koala

```bash
docker compose up --build -d
```

### Start Koala

```bash
docker compose run --rm koala
```

### Prune Koala

```bash
docker compose down -v
```

### User informations

- **Username**: `koala`
- **Password**: `koala`

## Versioning

- 1.0.3

## Authors

- **tun43p** - _Initial work_ - [tun43p](https://github.com/tun43p).

## License

This project is licensed under the MIT License, see the [LICENCE](LICENSE) file for details.
