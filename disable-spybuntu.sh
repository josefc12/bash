#!/bin/bash
# Script to disable Ubuntu telemetry and data collection

# Exit on error
set -e

echo "Disabling Ubuntu telemetry..."

# Remove popularity-contest (package usage reporting)
if dpkg -l | grep -q popularity-contest; then
  sudo apt purge -y popularity-contest
  echo "Removed popularity-contest"
else
  echo "popularity-contest not installed"
fi

# Disable apport (crash reporting)
sudo systemctl disable apport.service
sudo systemctl stop apport.service
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
echo "Disabled apport"

# Disable whoopsie (error reporting)
sudo systemctl disable whoopsie
sudo systemctl stop whoopsie
echo "Disabled whoopsie"

# Opt out of ubuntu-report metrics
ubuntu-report send no
echo "Opted out of ubuntu-report"

# Disable connectivity checking
gsettings set org.gnome.system.network connectivity-enabled false
echo "Disabled connectivity checking"

echo "Telemetry disabled. Reboot recommended."
