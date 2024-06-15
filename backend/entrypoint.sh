#!/bin/sh

check_postgres() {
  echo "Checking PostgreSQL status..."
  nc -z postgres 5432
}

# Wait until PostgreSQL is ready
until check_postgres; do
  echo "PostgreSQL is unavailable - sleeping"
  sleep 1
done

echo "PostgreSQL is up - executing command"

yarn run start:prod
