#!/usr/bin/env bash

set -e

if [ "$EUID" -ne "0"] ; then
	echo "Script must be run as root." >&2
	exit 1
fi


if which puppet >/dev/null ; then
	echo "Puppet is already installed"
	exit 0
fi

echo "Installing Puppet repo for Ubuntu 12.04 LTS"
#download from puppetlabs
wget -qO /tmp/puppetlabs-precise.deb https://apt.puppetlabs.com/puppetlabs-release-precise.deb

#install
dpkg -i /tmp/puppetlabs-precise.deb

#delete
rm /tmp/puppetlabs-precise.deb

apt-get update

#aptitude upgrade -y

echo Installing puppet

apt-get install -y puppet

echo "Puppet Installed!"