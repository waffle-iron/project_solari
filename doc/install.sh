#!/bin/bash
#
# constract project-solari
#

set -eu

mkdir work
cd work/
#sudo apt-get install -y libssl-dev libreadline-dev
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc # have to do this to launch rails
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install -v 2.3.0
rbenv global 2.3.0
ruby -v
gem install bundle
rbenv exec bundle init

git clone https://github.com/marpore/project_solari.git
cd project_solari
#sudo apt-get install libmysqlclient-dev
#sudo apt-get install mysql-server # set password
rbenv exec bundle install --path vendor/bundle

mysql -u root -p << EOS
CREATE USER 'solari'@'localhost' IDENTIFIED by 'urgod_shimane';
GRANT ALL PRIVILEGES ON *.* TO 'solari'@'localhost';
CREATE DATABASE project_solari_development;
CREATE DATABASE project_solari_test;
EOS

bundle exec rake db:migrate
bundle exec rails s
# access http://localhost:3000/

exit 0

# on web site
comment out config/initializers/rails_admin.rb line 6:13

http://localhost:3000/admin/
http://localhost:3000/admin/role/new name="admin"
http://localhost:3000/admin/user/new email="hoge" password="hoge" Roles->"admin"
