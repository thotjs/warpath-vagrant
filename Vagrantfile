require 'fileutils'

os = "coreos"

if ENV["VAGRANT_OS"]
  os = ENV["VAGRANT_OS"].downcase
end

osPath = os + ".rb"

if File.exist?(osPath)
  require_relative osPath
else
  print "The configuration file for this operating system wasn't found"
end