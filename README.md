TitanBox
========

## Getting Started

### Dependencies

- [VirtualBox](http://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)

### Provision the VM

Change into the project directory:

	cd titanbox

Download and provision the VM:

	vagrant up

This will download the VirtualBox image and provision Titan onto it.

### Starting Titan

A script for starting Titan is installed to "/usr/local/bin/start_titan" and should be in the path of the vagrant user:

	start_titan
	
Verify REST API service is accessible on your host (not within the VM):

	curl http://localhost:8182/graphs

## Misc

A symlink to the created for the Titan distribution, "/usr/local/titan".

Of note is that we're not using the latest release of titan (3.2) and are using 3.1 due to [a bug](https://groups.google.com/forum/#!msg/aureliusgraphs/NSJOQDl13Gc/mdee0nUDQRMJ).
