#!/bin/bash

if [ -d "/opt/dfir/" ] && echo "Directory /opt/dfir/ exists."; then
  unzip "*.zip" -d /opt/dfir
else
  sudo chown -R $USER:$USER /opt && mkdir /opt/dfir && unzip "*.zip" -d /opt/dfir
fi
