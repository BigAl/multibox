Multibox
=========

A basic multinode [Vagrant](http://vagrantup.com) configuration handy for testing Client Server Apps.

## Usage
INSTANCES - set the number of client nodes

DOMAIN - domain name of all nodes

SUBNET - The hostonly private network

## Provisioner
Shell: bootstrap.sh currently installs puppet on all nodes

Puppet: default.pp should print out "Hello World" if everything is working ok.

## Vagrant Box
A suitable vagrant box, CentOS, is available on my [Dropbox](https://dl.dropboxusercontent.com/u/2236361/VMs/centos-6.5_x86_20140819.box). This box is preinstalled with [Puppet](http://puppetlabs.com/) and [Ansible](www.ansible.com)
