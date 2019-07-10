App Demo
================

Ruby on Rails
-------------

This application requires:

- Ruby 2.6.3
- Rails 5.2.3
- PostgreSQL 10

Getting Started
---------------
1. Configure the database connection in the file config/database.yml.
  Currently it's configured to use unix sockets and default user (postgres)

2. Install bundler and needed gems:

    `$ gem install bundler`

    `$ bundle install`

3. Create and prepare the development database:

    `$ rake db:setup`

4. Run the development server

    `$ rails server`

5. Open you browser and go to http://localhost:3000/

6. You can login using the default user:

    _email: user@example.com_

    _password: changeme_



Credits
-------
