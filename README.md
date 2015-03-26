# Stash-api

[![Build Status](https://travis-ci.org/johnbeynon/stash-api.svg?branch=master)](https://travis-ci.org/johnbeynon/stash-api)
[![Code
Climate](https://codeclimate.com/github/johnbeynon/stash-api/badges/gpa.svg)](https://codeclimate.com/github/johnbeynon/stash-api)

Stash-API is an API for storing links and tagging them. It's meant for personal
usage and is self hosted.

Links are stored in collections so it can be used to maintain different
collections of links which can be further categorised with tags.

# Docs

[API Docs](/docs/schema/api.md)

# Deployment

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

# Dockerized for development

I'm still learning this stuff, so far its...

```
docker-compose build
docker-compose up
docker-compose run web bin/setup
```

Access endpoints via `http://<docker-host-ip>:5000`
