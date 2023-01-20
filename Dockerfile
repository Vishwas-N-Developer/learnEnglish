FROM ruby:2.7.6

RUN apt-get update -qq && \
  apt-get install -y sqlite3 libsqlite3-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile* /app/

RUN gem install bundler -v 2.1.4 && \
  bundle install --jobs 20

COPY . /app
