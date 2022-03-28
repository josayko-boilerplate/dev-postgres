# dev-postgres

## Requirements for a Django application development:
- `python 3.x`, `django 3.x`, `docker` and `docker-compose`
- Install either `psycopg2-binary` or `psycopg2` module:
  - `pip install psycopg2-binary`

#### Django 3.x project configuration example

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
        'NAME': 'admin',
        'USER': '<your_dataabse>',
        'HOST': 'localhost',
        'PORT': 5432,
        'PASSWORD': 'S3cret'
    }
}
```

## Start postgres database containers

```
$ docker-compose up -d
```

#### Connect to the database via CLI

```
$ docker exec -it dev-postgres /bin/bash
```

#### Connect to the database via pgadmin4 dashboard

1. Login to pgadmin4 dashboard at `127.0.0.1:8080`. By default, email is `admin@admin.org` and password is `S3cret`
2. `Add new server`, enter a name in General tab
3. In Connection tab, default `Hostname` is `postgres-server`. Leave default Port at `5432` and Maintenance database to `postgres`. `Username` is `admin` and Password is `S3cret`
