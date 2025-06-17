#! /bin/bash

# Stop Apache if it's already running
if systemctl is-active --quiet httpd; then
  echo "Stopping Apache first"
  systemctl stop httpd
fi

# Perform prerequisites
yum install -y httpd
