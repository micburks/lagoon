#!/bin/bash

#################
#   INSIDE VM   #
#################

# Update and Install
sudo apt-get update -y
sudo apt-get upgrade -y
# If asked:
# install grub bootloader to /dev/sda
sudo apt-get install -y git make cmake

# Installing Postgres
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y postgresql-9.4 postgresql-plpython-9.4 postgresql-server-dev-9.4 postgis

# Create superuser in Postgres
sudo -iu postgres
# TODO: This should be aquameta user
## echo "create role aquameta superuser login;" | psql
echo "create role vagrant superuser login;" | psql
logout

# Modify postgresql.conf
sudo -iu root
echo "shared_preload_libraries = 'pg_http'" >> /etc/postgresql/9.4/main/postgresql.conf
logout

# Get Aquameta
git clone https://github.com/aquametalabs/aquameta ~/aquameta

# Build background worker
cd ~/aquameta/core/004-aquameta_endpoint/servers/background_worker && git clone https://github.com/qpfiffer/libwebsockets && cd libwebsockets && mkdir build && cd build && cmake .. && make && sudo make install

# Build background worker
cd ../.. && make && sudo make install

# Create extension
echo "create extension pg_http;" | psql postgres
# Reset library cache to acces pg_http.so
sudo ldconfig

# Reload Postgresql
sudo service postgresql restart

# Build Aquameta
cd ~/aquameta && ./build.sh

# Clean and minimize machine
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
#################
#   Exit VM     #
#################
