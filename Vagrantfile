# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'

VAGRANT_API_VERSION = "2"

CONFIG = 'config.rb'

# Defaults for config options defined in CONFIG
$num_instances = 3
$vb_gui = false
$vb_memory = 1024
$vb_cpus = 1
$base_ip_addr = "192.168.27"

$shell_script = ""

require_relative "shell.rb"

if File.exist?(CONFIG)
  require_relative CONFIG
end

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  (1..$num_instances).each do |i|
    config.vm.define vm_name = "warpath%02d" % i do |config|
#      config.vm.box = "chef/centos-6.5"
      config.vm.box = "chef/fedora-20"

      config.vm.hostname = vm_name

      config.vm.provider :virtualbox do |vb|
        vb.gui = $vb_gui
        vb.memory = $vb_memory
        vb.cpus = $vb_cpus
      end

      config.vm.network :private_network, ip: "#{$base_ip_addr}.#{i+1}"

      config.vm.provision :file, :source => "nvm.sh", :destination => "~/nvm.sh"
      config.vm.provision :file, :source => "docker.service", :destination => "~/docker.service"

      config.vm.provision :shell do |shell|
        shell.privileged = true
        shell.inline = $shell_script
      end
    end
  end
end