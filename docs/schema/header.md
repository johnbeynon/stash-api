# Stash API

## Authentication

Stash API implements a simple authorization mechanism. You set a config variable
`AUTH_TOKEN` which is passed as the authorization token header and if it matches
then the request will be processed.

```
$ curl -X GET https://api.stash.com/collections -H "Content-Type: application/json" -H "Authorization: Token token=<YOUR_AUTH_TOKEN>"
```
