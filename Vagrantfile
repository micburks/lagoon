# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

##################
  # Basic Config
##################
  config.vm.box = "micburks/lagoon"

  # Should this be false - Only updated when user attempts
  config.vm.box_check_update = true
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "lagoon"

##################
  # Provisions
##################
  # What provisions might we need?
  # config.vm.provision "shell", inline: "cd aquameta && git pull && ./backup_aquameta && dropdb aquameta && ./build.sh"

##################
  # Synced folders
##################
  # What resources might we need to share?
  # Maybe filesystem for assets/pictures/videos
  # Maybe backups/bundles here?
  config.vm.synced_folder "~/lagoon/bundles/", "/srv/aquameta/bundles", create: true

  # If Aquameta install was shared - run Aquameta install everytime 'vagrant up'
  # config.vm.synced_folder "~/aquameta/", "/srv/aquameta"

  # Preloaded from hashicorp/precise64
  # config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

##################
  # SSH
##################
  config.ssh.username = "vagrant"

  # Maybe this should be false?
  config.ssh.forward_agent = true

  # By default, this is already true
  config.ssh.insert_key = true

##################
  # Forwarded ports
##################
  config.vm.network "forwarded_port", guest: 8080, host: 8081, auto_correct: true
  # By default 2222 is forwarded to 22 for SSH access


# Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
# such as FTP and Heroku are also available. See the documentation at
# https://docs.vagrantup.com/v2/push/atlas.html for more information.
# config.push.define "atlas" do |push|
#   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
# end

# Enable provisioning with a shell script. Additional provisioners such as
# Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
# documentation for more information about their specific syntax and use.
# config.vm.provision "shell", inline: <<-SHELL
#   sudo apt-get update
#   sudo apt-get install -y apache2
# SHELL

end
