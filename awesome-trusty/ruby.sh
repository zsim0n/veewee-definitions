# apt prerequisits
# depend on git and wget

RUBY_VERSION=1.9.3-p547

cd /tmp

wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-$RUBY_VERSION.tar.gz
tar xvzf ruby-$RUBY_VERSION.tar.gz
cd ruby-$RUBY_VERSION
./configure --prefix=/opt/ruby
make
make install
cd ..
rm -rf ruby-$RUBY_VERSION
rm ruby-$RUBY_VERSION.tar.gz

RUBYGEMS_VERSION=2.3.0
wget http://production.cf.rubygems.org/rubygems/rubygems-$RUBYGEMS_VERSION.tgz
tar xzf rubygems-$RUBYGEMS_VERSION.tgz
cd rubygems-$RUBYGEMS_VERSION
/opt/ruby/bin/ruby setup.rb
cd ..
rm -rf rubygems-$RUBYGEMS_VERSION
rm rubygems-$RUBYGEMS_VERSION.tgz

echo 'PATH=$PATH:/opt/ruby/bin/' > /etc/profile.d/vagrantruby.sh

# default gems config
cat << EOF > ~/.gemrc
---
:sources:
- http://rubygems.org
install: --no-rdoc --no-ri
update: --no-ri --no-rdoc
EOF

gem install bundler --no-ri --no-rdoc

#gem update --system

#install puppet

adduser --system --group --home /var/lib/puppet puppet

gem install puppet --no-ri --no-rdoc
# apt-get -y install librarian-puppet
gem install librarian-puppet --no-ri --no-rdoc