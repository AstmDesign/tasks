## Project status ##
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/1e8add0ebcf34774b0188855a10b8210)](https://www.codacy.com/app/AstmDesign/tasks?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=AstmDesign/tasks&amp;utm_campaign=Badge_Grade)

== README

The Tasks application is built using Ruby on Rails v 5.2.2, an MVC web application framework.

# Installing the application #

First you need to make sure that your machine has Ruby & Postgres database then you need to run the below commands


## Start postgres server ##
```
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
```

## Database creation ##
```
bundle exec rake db:create
bundle exec rake db:migrate
# seed the Database with some test data to insert default administration data.
bundle exec rake db:seed
```

## Start rails server ##
```
rails s
```

## Open on the browser ##

http://localhost:3000
