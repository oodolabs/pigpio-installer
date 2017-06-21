#!/usr/bin/env bash

sudo wget https://raw.githubusercontent.com/oodolabs/pigpio-setup/master/pigpiod.service -O /lib/systemd/system/pigpiod.service
sudo systemctl enable pigpiod
sudo systemctl start pigpiod
