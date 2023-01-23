# Architecture

- [Architecture](#architecture)
  - [/config](#config)
  - [/shared](#shared)
    - [/bin](#bin)
    - [/lib](#lib)
    - [/tmp](#tmp)

## /config

Folder that contains all the configuration files sent to the machine. **Be careful, this is not a volume, it is not shared in real time, to update its content, you must restart the container.**

## /shared

Folder that groups all the volumes (folders shared in real time) of the container. **Be careful, if you delete a file from a pa container folder, it will also disappear from the host machine!**

### /bin

Folder that gathers the executables shared between the host machine and the container.

### /lib

Folder used to add shared libraries between the host machine and the container. You can hide files or folders from this directory in the `.gitignore`.

### /tmp

Folder that contains temporary files to be shared between the host machine and the container. It is hidden by default in the `.gitignore` to avoid sharing sensitive data.
