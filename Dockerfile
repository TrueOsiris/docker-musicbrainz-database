FROM postgres:9.6

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get -y -q install \
   git-core \
   build-essential \
   libxml2-dev \
   libpq-dev \
   libexpat1-dev \
   libdb-dev \
   libicu-dev \
   postgresql-server-dev-9.6 \
   wget

# pull musicbrainz controller files from git & install them into postgresql repo
RUN git clone https://github.com/metabrainz/postgresql-musicbrainz-unaccent.git \
 && git clone https://github.com/metabrainz/postgresql-musicbrainz-collate.git \
 && cd postgresql-musicbrainz-unaccent \
 && make \
 && make install \
 && cd ../postgresql-musicbrainz-collate \
 && make \
 && make install \
 && cd ../ \
 && echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf
