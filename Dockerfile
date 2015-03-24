FROM ruby:2.2.1

RUN mkdir /myapp

# CACHE THE GEMS IN THE CONTAINER
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install 

ADD . /myapp
WORKDIR /myapp
