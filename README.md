# DONDOCA API

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
``` Bash
bundle install
rails db:create
rails db:migrate
rails db:seed
```

Production:
``` Bash

```

Tests:
``` Bash
bundle exec rubocop --parallel
bin/rake
Run bundle exec rails test
```
