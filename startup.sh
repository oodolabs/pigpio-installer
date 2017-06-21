#!/usr/bin/env bash

sudo bash -c "cat <<EOT >> /lib/systemd/system/pigpiod.service
[Unit]
Description=pigpio daemon
[Service]
ExecStart=/usr/local/bin/pigpiod
Type=forking
[Install]
WantedBy=multi-user.target
EOT"

sudo systemctl enable pigpiod
sudo systemctl start pigpiod
