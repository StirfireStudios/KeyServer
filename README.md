# Mercury website

## Ruby Version

Ruby version is handled by .ruby-version, suggest you use [RVM](http://rvm.io) to handle it properly

## Dependencies

  1. Postgres 9.6. A local install is recommended. On a Mac I recommend [Postgres.app](https://postgresapp.com)
  2. Ruby 2.3.3 - this can be installed via [RVM](http://rvm.io) (which is the reccomended way to handle ruby and gems)

## Setup

  1. Open a terminal to your rails projects directory and then clone the project.
  2. Make sure you know your postgres's root username and password.
  3. run `bin/setup` from the directory created by the clone in step 1 and enter your username and password.

## Running

Once setup is done, you can start a local server by opening a terminal, going to the directory created by the clone in setup step 1 and running `rails s`.

## Updating

After pulling/merging a branch it's best to run a `rake db:migrate` to ensure your database is up to date.
