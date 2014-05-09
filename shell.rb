$shell_script = <<EOS
  yum -y install deltarpm
  yum -y update
  yum -y install rsyslog vim git-core docker-io htop iotop iftop ntop lsof tcpdump sysstat nmap mtr psacct strace gcc-c++ make openssl-devel binutils-devel bison crash elfutils-devel elfutils-libelf-devel flex gcc glibc-devel glibc-devel.i686 kernel-devel libdwarf libdwarf-devel libgcc.i686 make perl zlib-devel
  systemctl start psacct
  systemctl enable psacct
  git clone https://github.com/dtrace4linux/linux
  cd linux
  make all
  make install
  make load
  cd ..
  git clone https://github.com/creationix/nvm.git /opt/nvm
  mkdir /usr/local/nvm
  mkdir /usr/local/node
  mv /home/vagrant/nvm.sh /etc/profile.d/
  source ~/.bash_profile
  nvm install 0.11
  nvm alias default 0.11
  wget https://get.docker.io/builds/Linux/x86_64/docker-latest -O docker
  chmod +x docker
  mv docker /usr/bin/
  mv /home/vagrant/docker.service /etc/systemd/system/
  systemctl start docker
  systemctl enable docker
  docker pull fedora
EOS