# DONDOCA API

[![Github Actions CI](https://github.com/nullbr/dondoca-api/actions/workflows/ci.yml/badge.svg?event=push)](https://github.com/nullbr/dondoca-api/actions)

### This is the backend for Dondoca Web

It handles user authentication with Doorkeeper, and allows for website cutomization of workers, and services offered.

This is under active cuntruction, features getting implemented:

- Customr scheduling
- Shopping loginc for gift cards and mambership

### Instalation

Prerequisite:

- ruby 3.1.2
- rails 7.0.2
- postgreSQL

Developement:

```Bash
bundle install
rails db:create
rails db:migrate
rails db:seed
```

### Run Tests:

```Bash
bundle exec rubocop --parallel
bin/rake
Run bundle exec rails test
```

### Production deploy:

- install rbenv

```Bash
sudo apt update
sudo apt upgrade
sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# Run line by line
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exit
#
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv -v
```

- install ruby:

```Bash
rbenv install 3.1.2 --verbose
rbenv global 3.1.2
ruby -v
gem install bundler
```

- Install and configure Passenger & Nginx:

```Bash
# install nginx
sudo apt-get install nginx
#(a) Install the PGP key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
#(b) App the APT repository
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update
#(c) Install Passenger and Nginx module
sudo apt-get install -y libnginx-mod-http-passenger
#(d) Make sure the configuration files exist
if [ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]; then sudo ln -s /usr/share/nginx/modules-available/mod-http-passenger.load /etc/nginx/modules-enabled/50-mod-http-passenger.conf ; fi
sudo ls /etc/nginx/conf.d/mod-http-passenger.conf

sudo nano /etc/nginx/conf.d/mod-http-passenger.conf # add passenger_ruby /home/deploy/.rbenv/shims/ruby;
sudo rm /etc/nginx/sites-enabled/default
sudo nano /etc/nginx/sites-enabled/dondoca-api
# add server {
#   listen 80;
#   listen [::]:80;

#   server_name _;
#   root /home/deploy/sample_rails_app/current/public;
#   passenger_enabled on;
#   passenger_app_env staging;
# }
sudo service nginx start
```

- install postgresql:
  https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart

- install dependencies for pg gem:

```bash
$ sudo apt install postgresql-contrib libpq-dev
```

- configure swap space:
  https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-20-04

```Bash
sudo apt-get update
sudo apt-get upgrade
```

- deploy production with capistrano

```bash
cap production deploy
```

- enter rails consoler

```bash
RAILS_ENV=production bundle exec rails c
```
