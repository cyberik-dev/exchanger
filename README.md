# README

A web app that allows users to analyze historical data for currency exchange rates.

## Want to try it?

### Option 1 — Visit the hosted version

* Visit https://guarded-taiga-45377.herokuapp.com/

### Option 2 — Run it locally

#### Prerequisites

* Ruby 2.7.0
* yarn (or npm)
* PostgreSQL

#### Setup

```
$ git clone git@github.com:cyberik-dev/exchanger.git
$ cd exchanger/
$ cp .env.sample .env
$ cp congig/database.sample.yml database.yml
$ bundle install
$ yarn install (or npm install)
$ bundle exec rake db:setup
```

#### Running

```
$ foreman start -f Procfile.dev
```

Now you can visit http://localhost:5000 to play with the app.
