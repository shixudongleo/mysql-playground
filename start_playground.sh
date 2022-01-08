#!/bin/bash

docker rmi -f sakila-mysql:8.0 || true
docker rm -f  sakila-sql || true
docker build -t sakila-mysql:8.0  .

docker run --name sakila-sql -d sakila-mysql:8.0

while !(docker exec -it sakila-sql mysqladmin -uroot -psakila --silent ping > /dev/null 2>&1)
do
    sleep 1
    echo "waiting for mysql ..."
done

# sleep 10 for waiting mysql db actually ready
sleep 10
docker exec -it sakila-sql mysql -uroot -psakila --init-command='USE sakila;'


# sleep 30;
# docker exec -it sakila-sql mysql -uroot -psakila
# docker exec -it sakila-sql mysqladmin -uroot -psakila ping

# display warning or error if you don't mind
# while !(docker exec -it sakila-sql mysqladmin -uroot -psakila --silent ping)
