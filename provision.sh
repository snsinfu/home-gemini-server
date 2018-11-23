#!/bin/sh -eux

cd config

# Base system
install -m 0644 loader.conf /boot
install -m 0644 sysctl.conf /etc
install -m 0644 rc.conf     /etc
install -m 0644 resolv.conf /etc
install -m 0644 ipfw.rules  /etc
install -m 0644 sshd_config /etc/ssh

pkg install -y dnsmasq

install -m 0644 dnsmasq.conf    /usr/local/etc
install -m 0644 hostapd.conf    /etc
install -m 0600 hostapd.wpa_psk /etc

service hostapd restart
service dnsmasq restart

# User
test -e /home || ln -s /usr/home /home

pw groupadd sinfu                                      || test $? -eq 65
pw useradd  sinfu -g sinfu -G wheel -h - -s /bin/sh -m || test $? -eq 65

install -m 0700 -g sinfu -o sinfu -d              /home/sinfu/.ssh
install -m 0600 -g sinfu -o sinfu authorized_keys /home/sinfu/.ssh

# Additional packages
pkg install -y htop mosh
