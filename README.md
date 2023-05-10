# DONDOCA API

[![Github Actions CI](https://github.com/nullbr/dondoca-api/actions/workflows/ci.yml/badge.svg?event=push)](https://github.com/nullbr/dondoca-api/actions)
[![Github Actions CD](https://github.com/nullbr/dondoca-api/actions/workflows/cd.yml/badge.svg?event=push)](https://github.com/nullbr/dondoca-api/actions)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
![Ruby Version](https://img.shields.io/badge/ruby_version-3.1.2-blue.svg)
![Rails Version](https://img.shields.io/badge/rails_version-7.0.2-blue.svg)

## This is the backend for Dondoca Web

It handles user authentication with Doorkeeper, and allows for website cutomization of workers, and services offered.

This is under active cuntruction, features getting implemented:

- Customr scheduling
- Shopping loginc for gift cards and mambership

## Instalation

### Prerequisite:

- ruby 3.1.2
- rails 7.0.2
- postgreSQL

### Developement:

1. Clone this repo
1. Install PostgreSQL in case you don't have it
1. Run `./bootstrap.sh`
1. `rspec` and make sure all tests pass
1. `rails s`
1. You can now try your REST services!

### Docker:

1. Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)
1. Run `bootstrap.sh` with the name of your project and the `-d` or `--for-docker` flag like `./bootstrap.sh -d`
1. Generate a secret key for the app by running `bin/web rake secret`, copy it and add it in your environment variables.
1. (Optional) If you want to deny access to the database from outside of the `docker-compose` network, remove the `ports` key in the `docker-compose.yml` from the `db` service.
1. (Optional) Run the tests to make sure everything is working with: `bin/rspec .`.
1. You can now try your REST services!

## Dev scripts

This template provides a handful of scripts to make your dev experience better!

- bin/bundle to run any `bundle` commands.
  - `bin/bundle install`
- bin/rails to run any `rails` commands
  - `bin/rails console`
- bin/web to run any `bash` commands
  - `bin/web ls`
- bin/rspec to run specs
  - `bin/rspec .`

You don't have to use these but they are designed to run the same when running with docker or not.
To illustrate, `bin/rails console` will run the console in the docker container when running with docker and locally when not.

## Run Tests:

```Bash
bundle exec rubocop --parallel
bin/rake
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
