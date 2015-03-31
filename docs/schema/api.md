# Stash API

## Authentication

Stash API implements a simple authorization mechanism. You set a config variable
`AUTH_TOKEN` which is passed as the authorization token header and if it matches
then the request will be processed.

```
$ curl -X GET https://api.stash.com/collections -H "Content-Type: application/json" -H "Authorization: Token token=<YOUR_AUTH_TOKEN>"
```

## Collections


### Attributes
| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when collection was created | `"2012-01-01T12:00:00Z"` |
| **id** | *uuid* | unique identifier of collection | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | Name of the collection | `"My Collection"` |
| **updated_at** | *nullable date-time* | when collection was updated | `"2012-01-01T12:00:00Z"` |
### Collections Create
Create a new collection.

```
POST /collections
```

#### Optional Parameters
| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **name** | *string* | Name of the collection | `"My Collection"` |


#### Curl Example
```bash
$ curl -n -X POST https://api.stash.com/collections \
  -H "Content-Type: application/json" \
 \
  -d '{
  "name": "My Collection"
}'

```


#### Response Example
```
HTTP/1.1 201 Created
```
```json
{
  "created_at": "2012-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "My Collection",
  "updated_at": "2012-01-01T12:00:00Z"
}
```

### Collections Delete
Delete an existing collection.

```
DELETE /collections/{collection_id}
```


#### Curl Example
```bash
$ curl -n -X DELETE https://api.stash.com/collections/$COLLECTION_ID \
  -H "Content-Type: application/json" \

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
{
  "created_at": "2012-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "My Collection",
  "updated_at": "2012-01-01T12:00:00Z"
}
```

### Collections Info
Info for existing collection.

```
GET /collections/{collection_id}
```


#### Curl Example
```bash
$ curl -n -X GET https://api.stash.com/collections/$COLLECTION_ID

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
{
  "created_at": "2012-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "My Collection",
  "updated_at": "2012-01-01T12:00:00Z"
}
```

### Collections List
List existing collections.

```
GET /collections
```


#### Curl Example
```bash
$ curl -n -X GET https://api.stash.com/collections

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
[
  {
    "created_at": "2012-01-01T12:00:00Z",
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "name": "My Collection",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```

### Collections Update
Update an existing collection.

```
PATCH /collections/{collection_id}
```

#### Optional Parameters
| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **name** | *string* | Name of the collection | `"My Collection"` |


#### Curl Example
```bash
$ curl -n -X PATCH https://api.stash.com/collections/$COLLECTION_ID \
  -H "Content-Type: application/json" \
 \
  -d '{
  "name": "My Collection"
}'

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
{
  "created_at": "2012-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "My Collection",
  "updated_at": "2012-01-01T12:00:00Z"
}
```


## Resource
FIXME

### Attributes
| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when resource was created | `"2012-01-01T12:00:00Z"` |
| **id** | *uuid* | unique identifier of resource | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **title** | *string* | title of resource | `"A title"` |
| **updated_at** | *nullable date-time* | when resource was updated | `"2012-01-01T12:00:00Z"` |
| **tags** | *array* | Tags | `[nil]` |
### Resource Create
Create a new resource.

```
POST /resources
```


#### Curl Example
```bash
$ curl -n -X POST https://api.stash.com/resources \
  -H "Content-Type: application/json" \

```


#### Response Example
```
HTTP/1.1 201 Created
```
```json
{
  "created_at": "2012-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "title": "A title",
  "updated_at": "2012-01-01T12:00:00Z",
  "tags": [
    null
  ]
}
```

### Resource Delete
Delete an existing resource.

```
DELETE /resources/{resource_id}
```


#### Curl Example
```bash
$ curl -n -X DELETE https://api.stash.com/resources/$RESOURCE_ID \
  -H "Content-Type: application/json" \

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
{
  "created_at": "2012-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "title": "A title",
  "updated_at": "2012-01-01T12:00:00Z",
  "tags": [
    null
  ]
}
```

### Resource Info
Info for existing resource.

```
GET /resources/{resource_id}
```


#### Curl Example
```bash
$ curl -n -X GET https://api.stash.com/resources/$RESOURCE_ID

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
{
  "created_at": "2012-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "title": "A title",
  "updated_at": "2012-01-01T12:00:00Z",
  "tags": [
    null
  ]
}
```

### Resource List
List existing resources.

```
GET /resources
```


#### Curl Example
```bash
$ curl -n -X GET https://api.stash.com/resources

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
[
  {
    "created_at": "2012-01-01T12:00:00Z",
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "title": "A title",
    "updated_at": "2012-01-01T12:00:00Z",
    "tags": [
      null
    ]
  }
]
```

### Resource Update
Update an existing resource.

```
PATCH /resources/{resource_id}
```


#### Curl Example
```bash
$ curl -n -X PATCH https://api.stash.com/resources/$RESOURCE_ID \
  -H "Content-Type: application/json" \

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
{
  "created_at": "2012-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "title": "A title",
  "updated_at": "2012-01-01T12:00:00Z",
  "tags": [
    null
  ]
}
```

### Resource Lists
Resources in collection.

```
GET /collections/{collection_id}/resources
```


#### Curl Example
```bash
$ curl -n -X GET https://api.stash.com/collections/$COLLECTION_ID/resources

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
[
  {
    "created_at": "2012-01-01T12:00:00Z",
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "title": "A title",
    "updated_at": "2012-01-01T12:00:00Z",
    "tags": [
      null
    ]
  }
]
```


## Tag
FIXME

### Attributes
| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of tag | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | Name of the tag | `"A Tag"` |
### Tag Create
Create a new tag.

```
POST /tags
```


#### Curl Example
```bash
$ curl -n -X POST https://api.stash.com/tags \
  -H "Content-Type: application/json" \

```


#### Response Example
```
HTTP/1.1 201 Created
```
```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "A Tag"
}
```

### Tag Delete
Delete an existing tag.

```
DELETE /tags/{tag_id}
```


#### Curl Example
```bash
$ curl -n -X DELETE https://api.stash.com/tags/$TAG_ID \
  -H "Content-Type: application/json" \

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "A Tag"
}
```

### Tag Info
Info for existing tag.

```
GET /tags/{tag_id}
```


#### Curl Example
```bash
$ curl -n -X GET https://api.stash.com/tags/$TAG_ID

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "A Tag"
}
```

### Tag List
List existing tags.

```
GET /tags
```


#### Curl Example
```bash
$ curl -n -X GET https://api.stash.com/tags

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "name": "A Tag"
  }
]
```

### Tag Update
Update an existing tag.

```
PATCH /tags/{tag_id}
```


#### Curl Example
```bash
$ curl -n -X PATCH https://api.stash.com/tags/$TAG_ID \
  -H "Content-Type: application/json" \

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "A Tag"
}
```

### Tag Lists
Tags in collection.

```
GET /collections/{collection_id}/tags
```


#### Curl Example
```bash
$ curl -n -X GET https://api.stash.com/collections/$COLLECTION_ID/tags

```


#### Response Example
```
HTTP/1.1 200 OK
```
```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "name": "A Tag"
  }
]
```


