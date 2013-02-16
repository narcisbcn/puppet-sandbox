# -*- mode: ruby -*-
# vi: set ft=ruby :

domain = 'example.com'

puppet_nodes = [
  {:hostname => 'puppet',  :ip => '192.168.2.10', :box => 'centos63', :fwdhost => 8140, :fwdguest => 8140, :ram => 512},
  {:hostname => 'client1', :ip => '192.168.2.11', :box => 'centos63'},
  {:hostname => 'client2', :ip => '192.168.2.12', :box => 'centos63'},
]

Vagrant::Config.run do |config|
  puppet_nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.box_url = 'https://dl.dropbox.com/sh/9rldlpj3cmdtntc/56JW-DSK35/centos-62-32bit-puppet.box'
      node_config.vm.host_name = node[:hostname] + '.' + domain
      node_config.vm.network :hostonly, node[:ip]

      if node[:fwdhost]
        node_config.vm.forward_port(node[:fwdguest], node[:fwdhost])
      end

      memory = node[:ram] ? node[:ram] : 256;
      node_config.vm.customize [
        'modifyvm', :id,
        '--name', node[:hostname],
        '--memory', memory.to_s
      ]

      node_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'provision/manifests'
        puppet.module_path = 'provision/modules'
      end
    end
  end
end
