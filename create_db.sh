#!/bin/bash

dropdb northwind || true
dropuser northwind_user || true

createdb northwind
[[ -e ./northwind.sql ]] && psql northwind < northwind.sql || true

psql template1 -c "create user northwind_user;"
psql template1 -c "alter user northwind_user password 'thewindisblowing';"
psql template1 -c "grant all on DATABASE northwind to northwind_user;"
psql northwind -c "GRANT ALL on ALL tables IN SCHEMA public to northwind_user"
