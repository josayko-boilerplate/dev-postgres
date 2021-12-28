# dev-postgres

## Requirements for a Django application development:
- `python 3.x`, `django 3.x`, `docker` and `docker-compose`
- Install postgres libraries and dependencies needed by `psycopg2`:

  - On Arch Linux: `sudo pacman -S postgresql-libs`
  - On Ubuntu/Debian: `sudo apt install postgresql-server-dev-all`

- Install the module with pip:
  - `pip install psycopg2`

#### Django 3.x project configuration example

- In `settings.py`

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'admin',
        'USER': 'admin',
        'HOST': 'localhost',
        'PORT': 5432,
        'PASSWORD': 'secret'
    }
}
```

## Start postgres database containers

```
$ docker-compose up -d
```

#### Connect to the database via CLI

```
$ docker exec -it dev-postgres_db_1 bash
root@24e8e33dac2a:/# psql -U admin
psql (13.3 (Debian 13.3-1.pgdg100+1))
Type "help" for help.

admin=#
```

#### Connect to the database via pgadmin4 dashboard

1. Login to pgadmin4 dashboard at `127.0.0.1:8080`. By default, email is `admin@admin.org` and password is `secret`
2. `Add new server`, enter a name in General tab
3. In Connection tab, default `Hostname` is `pgsql-server`. Leave default Port at `5432` and Maintenance database to `postgres`. `Username` is `admin` and Password is `secret`
