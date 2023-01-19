# README

This README would normally document whatever steps are necessary to get the
application up and running .

Things you may want to cover:
For Back-end - 

# Ruby version - "2.7.6"

# System dependencies - Rails version - "7.0.4"

# Configuration - 
  1. For handling CORS we are using rack-cors middleware gem in our gem file
     make sure "gem 'rack-cors'" is in your gem file
     In application.rb we also added following

        Rails.application.config.middleware.insert_before 0, Rack::Cors do
          allow do
            origins '*'
            resource '*', headers: :any, methods: [:get, :post, :patch, :put]
          end
        end

    for more please visit https://github.com/cyu/rack-cors

# Database creation - For create database run - "rails db:create"

# Database migratation - For migrate database run - "rails db:migrate"

# How to run the test suite - We are using Rspec for tesing in our application
    Hence for run test case just run command -  "rspec" 

# Running Rails application - for run your rails application please run command - "rails s -p 3001"
 
    Note- we are runing our rails on port 3001, Hence make sure you are on 3001 while running rails server each time.
# Happy browsing
