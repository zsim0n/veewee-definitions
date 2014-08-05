
# Initialize rbenv
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

apt-get -y install ruby-augeas augeas-tools libaugeas-ruby libaugeas-dev libaugeas-ruby1.9.1
apt-get -y install ruby-dev

GEM=gem

adduser --system --group --home /var/lib/puppet puppet
$GEM install puppet --no-ri --no-rdoc
$GEM install librarian-puppet --no-ri --no-rdoc