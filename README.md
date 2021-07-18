# dev-postgres

## Requirements:
-  `python 3.x`, `django 3.x`, `docker` and `docker-compose`
- Install postgres libraries and dependencies needed by `pyscopg2`
> On Arch Linux
`sudo pacman -S postgresql-libs`
> On Ubuntu/Debian 
`sudo apt install postgresql-server-dev-all`

- Install with module with pip 
`pip install psycopg2`

## Django 3.x project configuration
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

## Start postgres database containers and run django development server
`docker-compose up -d`
`python manage.py runserver`

