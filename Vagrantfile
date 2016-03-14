Vagrant.require_version '>= 1.8.1'

$ansible_local_workaround = <<ANSIBLE_LOCAL_WORKAROUND
apt-get update
apt-get install -y python-pip python-dev
pip install ansible==1.9.2
cp /usr/local/bin/ansible /usr/bin/ansible
ANSIBLE_LOCAL_WORKAROUND

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.network :private_network, ip: '10.0.0.20'
  config.vm.network :forwarded_port, guest: 5432, host: 5432
  config.vm.network :forwarded_port, guest: 6432, host: 6432

  config.vm.provision :shell, inline: $ansible_local_workaround
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = 'ansible/site.yml'
  end
end
