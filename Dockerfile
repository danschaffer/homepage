FROM ruby:3.1.3-bullseye
COPY root_ca.pem /usr/local/lib/ruby/3.1.0/rubygems/ssl_certs/rubygems.org/root_ca.pem
WORKDIR /app

RUN gem update
RUN gem install jekyll
RUN gem install bundler

CMD bundle install && bundle exec jekyll build

VOLUME /app
EXPOSE 4000
