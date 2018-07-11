#!/bin/bash
set -e
set -o pipefail

rsyslogd &

exec /usr/sbin/in.tftpd -vvvv -L -u tftp -s /usr/share/tftpboot-installation
