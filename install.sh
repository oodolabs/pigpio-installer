#!/usr/bin/env bash

pushd /opt

# install
rm pigpio.zip
sudo rm -rf PIGPIO
wget abyz.co.uk/rpi/pigpio/pigpio.zip
unzip pigpio.zip
cd PIGPIO
make
sudo make install

# setup systemd script
if [ -f /lib/systemd/system/pigpiod.service ]; then
  sudo rm /lib/systemd/system/pigpiod.service
fi

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

popd
