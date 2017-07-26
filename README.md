# Docker container for the MusicBrainz database

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/trueosiris/docker-musicbrainz-database/) 

Forked from arey/musicbrainz-database \
Based on https://hub.docker.com/_/postgres/ \
Based on the official Postgres image, this docker image installs a PostgreSQL 9.6 wilh all libraries required by the MusicBrainz database.

This database is however still an empty shell. \
This container will run a postgres database with the musicbrainz controller files installed. \
It needs the actual inject from my other container https://hub.docker.com/r/trueosiris/docker-musicbrainz-web/


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
psql -h 10.10.12.11 -p 5432 -U musicbrainz -d musicbrainz -l
```
or from within that docker
```
docker exec -it musicbrainz-database psql -U musicbrainz -d musicbrainz -l
```

