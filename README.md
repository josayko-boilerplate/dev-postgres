# dev-postgres

Development container with SSL enforced. Database initialization script in `initdb/01-init_db.sh`.


## Start postgres database containers

```
$ docker-compose up -d
```

### Connect to the database via CLI

```
$ psql "postgresql://postgres@localhost:5432/postgres?sslmode=require"
```

## Example configurations

### Django

#### Requirements:

- `python 3.x`, `django 3.x`, `docker` and `docker-compose`
- Install either `psycopg2-binary` or `psycopg2` module:
  - `pip install psycopg2-binary`

#### Example

- Create a database on CLI

```
$ docker exec -it dev-postgres /bin/bash
bash-5.1# psql -U admin
psql (14.2)
Type "help" for help.

admin=# CREATE DATABASE <your_database>;
```

- In `settings.py`

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': '<database_name>',
        'USER': 'postgres',
        'HOST': 'localhost',
        'PORT': 5432,
        'PASSWORD': 'postgres'
    }
}
```
