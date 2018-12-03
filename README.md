# Symfony application in Docker

## First run

After you've pulled the repo with 

```bash
$ git clone https://github.com/Livda/docker-symfony.git
```

Launch all the containers with 

```bash
$ docker-compose up -d
```

Then install download all the dependancies

```bash
$ docker-compose exec -u www-data php composer install
```

After you've edited your hosts file, which is in `/etc/hosts` to add that line

```bash
127.0.0.1 www.changeme.local
```

You should have your brand new Symfony application run at [http://www.changeme.local](http://www.changeme.local)

## Customize it

### Change the access URL

You just have to change the nginx config file in `nginx/symfony.conf` and change the `server_name` line.

Rebuild your containers and restart them (i.e. `docker-compose up -d --build`), edit your hosts files to match your new URL and that's all !
