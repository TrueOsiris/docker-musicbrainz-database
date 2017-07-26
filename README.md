# Docker container for the MusicBrainz database

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/trueosiris/musicbrainz-database/) 

Forked from arey/musicbrainz-database \
Based on https://hub.docker.com/_/postgres/ \
Based on the official Postgres image, this docker image installs a PostgreSQL 9.6 wilh all libraries required by the MusicBrainz database.

This database is however still an empty shell

## Run the container and import the musicbrainz data

```
docker run \
 -t \
 -d \
 -p 5432:5432 \
 --name musicbrainz-database \
 -v /path/to/storage/location:/var/lib/postgresql \
 -e POSTGRES_USER=musicbrainz
 -e POSTGRES_PASSWORD=musicbrainz
 -e POSTGRES_DB=musicbrainz
 trueosiris/musicbrainz-database
```

## Test it

In order to test your database installation, execute the below SQL query:
```
docker run -it --link musicbrainz-database:postgresql --rm trueosiris/musicbrainz-database sh -c 'exec psql -h postgresql -d musicbrainz -U musicbrainz -a -c "SELECT COUNT(*) FROM artist"'
```


