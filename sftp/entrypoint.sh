#!/bin/bash

# Set default user and password if not set environment variables.
SFTP_USER=${SFTP_USER:-sftp}
SFTP_PASSWORD=${SFTP_PASSWORD:-password}
SFTP_HOME_DIR=${SFTP_HOME_DIR:-/data}

# Set LogLevel if set environment variable.
if [ -v SFTP_LOG_LEVEL ]; then
    sed -i -e "s/#LogLevel INFO/LogLevel ${SFTP_LOG_LEVEL}/" /etc/ssh/sshd_config
fi

# Set RootDirectory if set environment variable.
if [ -v SFTP_ROOT_DIR ]; then
    sed -i -e "s# ChrootDirectory /var/sftp# ChrootDirectory ${SFTP_ROOT_DIR}#" /etc/ssh/sshd_config
else
    SFTP_ROOT_DIR=/var/sftp
fi

# See: http://veithen.github.io/2014/11/16/sigterm-propagation.html
PID=$!
wait ${PID}
wait ${PID}
EXIT_STATUS=$?

# Create sftp user and group
echo "Create user: ${SFTP_USER}"
useradd -m ${SFTP_USER} -s /usr/sbin/nologin
echo "Create group: sftp"
groupadd sftp
adduser ${SFTP_USER} sftp
echo "Set home directory to '${SFTP_HOME_DIR}'"
usermod -d ${SFTP_HOME_DIR} ${SFTP_USER}
mkdir -p ${SFTP_ROOT_DIR}/${SFTP_HOME_DIR}
chmod 755 ${SFTP_ROOT_DIR}
chown ${SFTP_USER}:sftp ${SFTP_ROOT_DIR}/${SFTP_HOME_DIR}

# Change sftp user password
echo "${SFTP_USER}:${SFTP_PASSWORD}" | chpasswd

# run sshd
/usr/sbin/sshd -D -e

