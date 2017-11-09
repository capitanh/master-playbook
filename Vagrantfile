# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
settings = YAML.load_file('provisioning/config.yaml')

#TODO: Put every ansible vble into etcd
#ENV["ANSIBLE_ETCD_URL"] = 'http://127.0.0.1:2379'
#ENV["ANSIBLE_ETCD_VERSION"] = 'v2'

Vagrant.configure(2) do |config|
  config.vm.box = settings['box_name']
  config.vm.hostname = settings['host_name']
  ports = settings['ports']
  ports.each do |forwarded_port|
    #config.vm.network "private_network", type: "dhcp"
    #config.vm.network "private_network", ip: "10.0.2.15"
    config.vm.network "forwarded_port", guest: forwarded_port['guestPort'], host: forwarded_port['hostPort']
  end

  config.vm.provider "virtualbox" do |vb|
    vb.name = settings['vb_name']
    vb.memory = settings['vb_memory']
    vb.cpus = settings['vb_cpus']
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
    vb.gui = false
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/ansible/site.yml"
    #ansible.verbose = "vvv"
    ansible.galaxy_role_file = "provisioning/ansible/requirements.yml"
    ansible.galaxy_roles_path = settings['roles_path']
  end

end
