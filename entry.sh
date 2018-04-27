#!/bin/sh

if [ ! -f /root/.install_lock ]; then
    /root/install -inputFile /root/installer_input.txt
    sed -i "s/DAEMON MLM .*/& port=1711/" /usr/local/MatLab/2018a/etc/license.dat
    touch /root/.install_lock
fi

/usr/local/MatLab/2018a/etc/lmstart -v -u matlab

while [ 1 ]
do
  sleep 60 &
  wait $!
done
