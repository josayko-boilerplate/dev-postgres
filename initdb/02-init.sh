#!/bin/sh
set -e

# The initial psql connection remains as the superuser (postgres)
# This user has the necessary privileges to create databases, users, and tables.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  -- Create the application user
  CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';

  -- Create the application database
  CREATE DATABASE $APP_DB_NAME;

  -- Grant all privileges on the database to the application user
  GRANT ALL PRIVILEGES ON DATABASE $APP_DB_NAME TO $APP_DB_USER;

  -- Change the owner of the database to the application user
  ALTER DATABASE $APP_DB_NAME OWNER TO $APP_DB_USER;

  -- Connect to the newly created database (still as the superuser POSTGRES_USER)
  -- This allows the superuser to create tables within the APP_DB_NAME database.
  \connect $APP_DB_NAME

  BEGIN;
    -- Create the todos table
    CREATE TABLE todos (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      description TEXT NOT NULL,
      completed BOOLEAN NOT NULL DEFAULT FALSE,
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW() -- Changed TIMESTAMPT to TIMESTAMPTZ for correctness
    );
  COMMIT;
EOSQL

