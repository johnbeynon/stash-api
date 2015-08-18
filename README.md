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

# Development

* Redis


# Deployment

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

# Dockerized for development

Make sure you have an updated version of ![Heroku Toolbelt](https://toolbelt.heroku.com/), a working ![Docker installation\(https://docs.docker.com/installation/) and the heroku-docker plugin installed:

```
$ heroku plugins:install heroku-docker
```

and start the application with:

```
$ docker-compose up web worker
```

Access endpoints via `http://<docker-host-ip>:8080`
