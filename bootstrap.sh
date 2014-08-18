#!/usr/bin/env bash
# This bootstraps Puppet on CentOS 6.x
# It has been tested on CentOS 6.4 64bit

set -e

REPO_URL="http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

# Install puppet labs repo
echo "Configuring PuppetLabs repo..."
yum install -y ${REPO_URL}

# Install Puppet...
echo "Installing puppet"
yum install -y puppet > /dev/null

echo "Puppet installed!"
