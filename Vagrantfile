Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.network :private_network, ip: '10.0.0.20'
  config.vm.network :forwarded_port, guest: 5432, host: 5432
  config.vm.network :forwarded_port, guest: 6432, host: 6432

  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'ansible/site.yml'
  end
end
