source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'mysql2'                # MySQL library
gem 'simple_form'           # Simplifies creation of HTML forms
gem 'devise'                # authentication
gem 'cancancan'             # athorization
gem 'jquery-rails'          # jQuery assets
gem 'jquery-ui-rails'       # jQuery UI assets
gem 'highcharts-rails'      # Highcharts assets
gem "aws-ses", :require => 'aws/ses'    # Email delivery with Amazon SES
gem 'will_paginate'         # Pagination
gem 'rack-mini-profiler'    # rails profiler  
gem "symbolize"             # allows symbols for values of attributes 
gem "browser"               # browser detection
gem 'hirb', :require => false   # make model table output pretty in rails console
# These are needed in production for now to populate sample data
gem 'populator'             # populate database with fake data
gem 'faker'                 # generate attributes for fake data

# Asset pipeline
# gem 'sprockets-rails', '2.1.3'            # Good performance. layouts/application renders in ~15msec. shared/_login_form takes ~8msec
# gem 'sprockets-rails', '2.1.4'            # Regression. layouts/application renders in ~250msec
gem 'sprockets-rails', git: 'https://github.com/rails/sprockets-rails.git'   # master. layouts/applications renders in ~70msec and shared/_login_form takes ~70msec

gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

group :production do
  gem 'unicorn'                           # Unicorn gem is required for deployment to OpsWorks
end

group :development, :test do
  gem 'quiet_assets'                      # Suppress "served asset..." log messages
  gem 'better_errors'                     # Significantly improves error output
  gem 'binding_of_caller'                 # Adds stack frames, variable inspection, etc to better_errors output
end

group :test do
  gem 'rspec-rails'                       # Unit testing
  gem 'fuubar'                            # format RSpec output
  gem 'shoulda-matchers'                  # Helpers for RSpec (must come after fuubar)
  gem 'factory_girl_rails'                # Factories for RSpec test
  gem 'guard-rspec'                       # Run tests when files change
  gem 'spring'                            # speeds up development by keeping application running in the background
  gem 'spring-commands-rspec', :require => false # Add Rspec to the list of commands Spring can run
  gem 'capybara'                          # Framework for request specs
  gem 'launchy'                           # add support for save_and_open_page to Capybara
end