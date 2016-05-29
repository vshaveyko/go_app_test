FROM ruby:2.3.1-alpine

RUN apk --update add --virtual build-dependencies \
                               build-base \
                               libxml2-dev \
                               libxslt-dev \
                               postgresql-dev \
                               nodejs \
                               tzdata \
                               && rm -rf /var/cache/apk/*

RUN bundle config build.nokogiri --use-system-libraries

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN gem update --system
RUN gem update bundler
RUN bundle install --path vendor/bundle --without development test doc --deployment --jobs=4
RUN bundle exec rake assets:precompile
