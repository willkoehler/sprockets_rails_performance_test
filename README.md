# Introduction

This application was created to demonstrate the performance regression between v2.1.3 and v2.1.4
of sprockets-rails as described in this issue <https://github.com/rails/sprockets-rails/issues/225>

# Setup

Install gems and prepare the database

    bundle
    bundle exec rake db:setup

Run the server

    bundle exec rails s

# Reproduce the regression

Visit <http://localhost:3000>. Page load times will appear in upper-left-hand corner. Click on the
load time for more detail. You may need to refresh the page several times before you start getting
consistent results.

The times provided by rack-mini-profile (accessed through the on-page tool in the upper-left-hand
corner) seem to be more accurate than the times in the Rails log.

See Gemfile for the three variations of the sprockets-rails gem that illustrate the regression.

You can login with user: sprockets@test.com, pw: password. But it's not required to see the performance
regression.

I'm using ruby 2.1.5p273
