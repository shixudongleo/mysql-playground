FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=sakila

# put sql files inside /docker-entrypoint-initdb.d to initialize data
ADD data/sakila-all.sql /docker-entrypoint-initdb.d/
