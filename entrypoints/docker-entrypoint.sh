#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Install gems
bundle install

# Create and migrate database
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed

# Run all the tests
bundle exec rspec spec/*

# Run the server
bundle exec puma -C config/puma.rb