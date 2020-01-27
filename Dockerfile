FROM ruby:2.7

ENV APP_PATH /usr/lib/app

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
RUN gem install bundler

RUN mkdir $APP_PATH
WORKDIR $APP_PATH
ADD Gemfile $APP_PATH/Gemfile
ADD Gemfile.lock $APP_PATH/Gemfile.lock
RUN bundle install --without test
ADD . $APP_PATH
