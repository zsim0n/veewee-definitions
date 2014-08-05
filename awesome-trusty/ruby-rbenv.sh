# Install rbenv system wide
#
# Dependencies:
#   * build-essential 
#   * git

# Set default global ruby version if it's unset
[ -z "$GLOBAL_RUBY_VERSION" ] && 
  export GLOBAL_RUBY_VERSION=1.9.3-p327

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv

# Install ruby-build
git clone git://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# Initialize rbenv on startup
echo '#!/usr/bin/env bash'                   > /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT=/usr/local/rbenv'   >> /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"'  >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"'               >> /etc/profile.d/rbenv.sh

# Make rbenv initializer script executable
chmod +x /etc/profile.d/rbenv.sh

# Initialize rbenv
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# Install ruby
rbenv install $GLOBAL_RUBY_VERSION
rbenv global $GLOBAL_RUBY_VERSION

# Rehash to update rbenv shims

gem install bundler

gem update --system
rbenv rehash

# add augeas support for puppet
# apt-get -y install ruby-augeas augeas-tools libaugeas-ruby libaugeas-dev libaugeas-ruby1.9.1
# apt-get -y install ruby-dev

#install puppet

GEM=gem

adduser --system --group --home /var/lib/puppet puppet
$GEM install puppet --no-ri --no-rdoc
$GEM install librarian-puppet --no-ri --no-rdoc