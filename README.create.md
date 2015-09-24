############
#   Pre    #
############
sudo apt-get install virtualbox vagrant
# or brew cask install virtualbox vagrant
vagrant box add hashicorp/precise64
vagrant init hashicorp/precise64
vagrant up
vagrant ssh


################
#   Install    #
################
# Run install script inside VM


#############
#   Post    #
#############
# Package box
# vagrant package --output aquametalabs/lagoon.box
vagrant package --output lagoon.box

# Add new box to vagrant
vagrant box add aquametalabs/lagoon lagoon.box

# Clean up
vagrant destroy
rm Vagrantfile

# Initialize new vm box
vagrant init aquametalabs/lagoon
