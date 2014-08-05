apt-get -y update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev libyaml-0-2
apt-get -y install language-pack-en
apt-get -y install vim
apt-get -y install dkms
apt-get -y install nfs-common
apt-get -y install git
apt-get -y install wget
apt-get -y install mc
apt-get -y install curl
apt-get -y install sqlite3
apt-get -y install libsqlite3-dev
# ruby
# augeas support
apt-get -y install ruby-augeas augeas-tools libaugeas-ruby libaugeas-dev libaugeas-ruby1.9.1
apt-get -y install ruby1.9.1-dev
