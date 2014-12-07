#!/bin/bash
cd /app
bundle install
bundle exec rake db:drop db:create db:migrate
bundle exec unicorn -p 3000
