FROM ruby:2.2.4-alpine

ENV BUILD_PACKAGES build-base postgresql-dev libxml2-dev libxslt-dev

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /app/user
WORKDIR /app/user

COPY ["Gemfile", "/app/user/"]
COPY Gemfile.lock /app/user/ 
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

ADD . /app/user
