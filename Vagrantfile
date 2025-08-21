$script = <<-SCRIPT
echo Provisioning...
DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y bison gdb gcc flex make vim
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"

    config.vm.provision "shell", inline: $script

    config.vm.synced_folder './', '/home/vagrant/compiladores'
end
