# Keyserver website

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

by default the seed will create two games:

  * Symphony of the Machine
  * Freedom Fall

and 4 platforms:

  * Steam
  * Oculus
  * Playstation Network - America
  * Playstation Network - Europe

and 10 keys for each game in each platform.

To generate keys to input into the site run: `rails runner 'KeyGenerator.Generate("<game name>", <number of keys>)'`

To generate 10 keys for Symphony of the machine, you'd run: `rails runner 'KeyGenerator.Generate("Symphony of the Machine", 10)'`

## Updating

After pulling/merging a branch it's best to run a `rake db:migrate` to ensure your database is up to date.
