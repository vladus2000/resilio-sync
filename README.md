# dnscrypt-proxy

You want to expose 55555 for the syncing and 8888 for the webui

It will run as root:root by default and it runs ```/bin/bash -c /startup.sh``` on start, see below on how to change user.

# Configuration
These options can be set via the environment variable -e flag:

- **RSLSYNC_SECRET**: secret for rslsync, one will be generated and added to the config file if no config file is provided and this is not set.
- **RSLSYNC_NAME**: user-friendlyish name for the device
- **PUID**: user id to use, will use root if this isn't specified, so you probably want to provide it
- **PGID**: group id to use, will use root if this isn't specified, so you probably want to provide it

# possible mounts

- /config - folder rslsync.conf lives in
- /.sync - folder that stores the other config information
- /var/log/rslsync.log - for the log file

