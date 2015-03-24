FROM ruby:2.2.1-onbuild

ONBUILD RUN bundle install
ONBUILD EXPOSE 5000
