Padrino on Heroku
=================

I wanted to deploy Padrino on Heroku but couldn't find information that worked 100% for me. So I worked through the steps and documentation I could find and built this so I'd never have to do it again.

You can clone this project and jump to the "heroku create" step OR create your own this way:

    padrino g project $PROJECT_NAME -t rspec -e erb -c less -s jquery -d datamapper -a postgres -b
    cd $PROJECT_NAME/
    curl "https://raw.github.com/darron/heroku-padrino-template/master/Gemfile" -o Gemfile
    # If you're not using rspec/erb/less/datamapper - you may need to edit the Gemfile with those changes.
    bundle install
    padrino g admin
    curl "https://raw.github.com/darron/heroku-padrino-template/master/config/database.rb" -o config/database.rb
    curl "https://raw.github.com/darron/heroku-padrino-template/master/config/unicorn.rb" -o config/unicorn.rb
    curl "https://raw.github.com/darron/heroku-padrino-template/master/Procfile" -o Procfile
    padrino rake gen
    git init .
    git add .
    git commit -a -m 'First commit.'
    heroku create $PROJECT_NAME
    git push heroku master
    heroku run rake dm:migrate
    heroku run rake seed
    # For local development
    padrino rake dm:migrate
    padrino rake seed

When deployed this app:

1. Uses Unicorn on Heroku for app serving - start it in local development mode with `foreman start`
2. Uses Postgres on Heroku for the database - SQLite in local development mode.
3. Has a basic admin interface created - more information [here](http://www.padrinorb.com/guides/padrino-admin).
4. Uses [Datamapper](http://datamapper.org) for the ORM.

Thanks to:

[https://gist.github.com/selman/569310](https://gist.github.com/selman/569310)

[http://datachomp.com/archives/using-unicorn-with-sinatra-or-padrino-on-heroku/](http://datachomp.com/archives/using-unicorn-with-sinatra-or-padrino-on-heroku/)

[http://www.padrinorb.com/guides/blog-tutorial#deploying-our-application](http://www.padrinorb.com/guides/blog-tutorial#deploying-our-application)
