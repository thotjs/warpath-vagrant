configPath = "config.rb"

if File.exist?(configPath)
  require_relative configPath
end

Vagrant.configure($vagrantVersion) do |config|
  config.vm.box = "coreos-alpha"
  config.vm.box_url = "http://storage.core-os.net/coreos/amd64-usr/alpha/coreos_production_vagrant.box"
end