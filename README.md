# lagoon

   Vagrant box for quick [Aquameta](https://github.com/aquametalabs/aquameta) install  

   Hosted on Atlas - [micburks/lagoon](https://atlas.hashicorp.com/micburks/boxes/lagoon)  

   Install with `vagrant init micburks/lagoon; vagrant up --provider virtualbox`  

## todo
1. Change
  * username - might not be cleanly possible. vagrant set up to only have 'root' and 'vagrant' users
  * ~~machine name~~
2. Aquameta install is currently broken
  * Install doesn't check out resources or widgets. Seems to be a problem with hash/blobs
3. Steal awesome features from laravel/homestead
  * sites - maybe needed if website framework is created
  * ~~port forwarding~~
  * ~~directory sharing~~
