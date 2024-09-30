$script = <<-SCRIPT
echo Provisioning...
apt-get update
apt-get install -y bison gdb gcc flex make vim
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "debian/bookworm64"

    config.vm.provision "shell", inline: $script

    config.vm.synced_folder './', '/home/vagrant/compiladores'
end
