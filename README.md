## README
[![Build Status](https://travis-ci.org/korkuje/web-backend.svg?branch=master)](https://travis-ci.org/korkuje/web-backend)

Project uses ruby 2.3.0 and rails 5 (currently in beta)

Setup: 
1. Install rvm
2. Create `.ruby-gemset` file with gemset name of you choice
3. run `bundle install` to get all dependencies
4. copy `config/database.yml.example` to `config/database.yml` and fill it with your database credentials
5. run `rails db:create db:migrate db:seed` (yup, rails not rake) to prepare your database
6. ???
7. PROFIT!
