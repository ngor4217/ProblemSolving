#!/bin/sh
# Ensure we're running as root
if [ $(id -u) != "0" ]
then
  echo "Run as root"
	exit $?
fi
# copy service file
cp tcptlsserver.service /lib/systemd/system/
# copy binaries
mkdir /usr/sbin/tcptlsserver
cp -a . /usr/sbin/tcptlsserver
rm -f /usr/sbin/tcptlsserver/tcptlsserver.service
# add execution right 
chmod +x /usr/sbin/tcptlsserver/Server
# install and start daemon
cd /lib/systemd/system/
systemctl enable tcptlsserver.service
systemctl start tcptlsserver.service
systemctl status tcptlsserver.service
