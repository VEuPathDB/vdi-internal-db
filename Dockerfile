FROM postgres:17-alpine3.21

COPY init/ docker-entrypoint-initdb.d/