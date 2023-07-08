FROM ruby:3.1.3-bullseye

WORKDIR /app

RUN gem update
RUN gem install jekyll
RUN gem install bundler

CMD bundle install && bundle exec jekyll build

VOLUME /app
EXPOSE 4000
