# Vagrant setup for Titan graph database.

Vagrant.configure("2") do | config |
  config.vm.box = "titanbox"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
  config.vm.hostname = "development.titan.vm"
  config.vm.network :forwarded_port, guest: 8182, host: 8182

  # VirtualBox
  config.vm.provider :virtualbox do | box |
    box.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Provision using Puppet.
  config.vm.provision :puppet do | puppet |
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "site.pp"
    puppet.module_path = "puppet/modules"
    puppet.options = "--verbose --debug"
  end

end
