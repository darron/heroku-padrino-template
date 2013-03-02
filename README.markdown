Padrino on Heroku
=================

I wanted to deploy Padrino on Heroku but couldn't find information that worked 100% for me. So I worked through the steps and documentation I could find and build this so I'd never have to do it again.

You can clone this project and jump to the "heroku create" step OR create your own this way:

    padrino g project $PROJECT_NAME -t rspec -e erb -c less -s jquery -d datamapper -a postgres -b
    cd $PROJECT_NAME/
    curl "https://gist.github.com/darron/5072031/raw/ab78fd766ab690e551b02c54f41c8b6b32044f57/gistfile1.rb" -o Gemfile
    bundle install
    padrino g admin
    curl "https://gist.github.com/darron/5072048/raw/24e4b3a4ba7d626ab5bff1ff6b42c241c080ea5c/gistfile1.rb" -o config/database.rb
    curl "https://gist.github.com/darron/5072056/raw/384c312cc843b72ef1f076f75b1d8c1f3350c576/gistfile1.rb" -o config/unicorn.rb
    curl "https://gist.github.com/darron/5072061/raw/9249f1e3f5ff275fb49be1428599df2c0e91ac47/gistfile1.rb" -o Procfile
    padrino rake gen
    git init .
    git add .
    git commit -a -m 'First commit.'
    heroku create $PROJECT_NAME
    git push heroku master
    heroku run rake dm:migrate
    heroku run rake seed

When deployed this app:

1. Uses Unicorn on Heroku for app serving - start it in local development mode with `foreman start`
2. Uses Postgres on Heroku for the database - SQLite in local development mode.
3. Has a basic admin interface created - more information [here](http://www.padrinorb.com/guides/padrino-admin).
4. Uses [Datamapper](http://datamapper.org) for the ORM.

Thanks to:

[https://gist.github.com/selman/569310](https://gist.github.com/selman/569310)

[http://datachomp.com/archives/using-unicorn-with-sinatra-or-padrino-on-heroku/](http://datachomp.com/archives/using-unicorn-with-sinatra-or-padrino-on-heroku/)

[http://www.padrinorb.com/guides/blog-tutorial#deploying-our-application](http://www.padrinorb.com/guides/blog-tutorial#deploying-our-application)