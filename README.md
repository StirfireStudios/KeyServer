# Keyserver website

## Ruby Version

Ruby version is handled by .ruby-version, suggest you use [RVM](http://rvm.io) to handle it properly

## Dependencies

  1. Postgres 9.6. A local install is recommended. On a Mac I recommend [Postgres.app](https://postgresapp.com)
  2. Ruby 2.4.0 - this can be installed via [RVM](http://rvm.io) (which is the reccomended way to handle ruby and gems)

## Setup

  1. Open a terminal to your rails projects directory and then clone the project.
  2. Change directory into what was created in step 1 - rvm should prompt you if you need to install a new ruby and it should also configure the gemset.
  3. Make sure you know your postgres's root username and password.
  4. run `bin/setup` from the directory created by the clone in step 1 and enter your username and password.

if `bin/setup` gives an error like: `An error occurred while installing pg (0.21.0), and Bundler cannot continue` then you need to setup your Postgres.app command line paths. Take a look at [this](https://postgresapp.com/documentation/cli-tools.html)

if `bin/setup` gives you an error like: `An error occurred while installing nokogiri (1.8.0), and Bundler cannot continue.`. Take a look at [this](https://stackoverflow.com/questions/39671424/gemloaderror-in-rails-application-due-to-nokogiri-gem)

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
