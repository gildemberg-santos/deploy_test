# Latest Ubuntu LTS
FROM ubuntu:latest

RUN apt-get -y update && apt-get -y upgrade
# RUN apt-get -y install curl git wget libpq-dev node libpq-dev vim

# #Install postgres
# RUN locale-gen en_US.UTF-8

# RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/postgresql.list'
# RUN \wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
# RUN apt-get -y update
# RUN apt-get -y install postgresql-9.3 postgresql-9.3-postgis-2.1
# #RUN apt-get -y install postgis

# RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# # Expose the PostgreSQL port
# EXPOSE 5432

# # Add VOLUMEs to allow backup of config, logs and databases
# VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# RUN service postgresql start

#ENTRYPOINT /bin/bash
#CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf", "start"]
