#!/bin/bash
set -e
set -o pipefail

exec /usr/sbin/in.tftpd -L -u tftp -s /usr/share/tftpboot-installation
