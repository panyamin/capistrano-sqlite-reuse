# Capistrano::SqliteReuse

Capistrano tasks for handling sqlite dbs when deploying Rails 4+ apps.

### Install

Add this to `Gemfile`:

    group :development do
      gem 'capistrano', '~> 3.2.1'
      gem 'capistrano-sqlite-reuse', '~> 1.0.0'
    end

And then:

    $ bundle install

### Setup and usage

- add to `Capfile`:

        require 'capistrano/sqlite_reuse'

You can now proceed with other deployment tasks.

### How it works

On deployment:

- we look for `database.yml` file to read the database location on the server<br/>
- if it exists, we add to linked files<br/>
- if not we look for file in current deployment, if it exists, we copy to shared and add to linked<br/>
- if nothing exists, then we allow database to be generated normally and it will be shared on next deploy.<br/>
