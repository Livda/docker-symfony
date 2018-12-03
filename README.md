# Symfony application in Docker

## First run

After you've pulled the repo with

```bash
$ git clone https://github.com/Livda/docker-symfony.git
```

To install all the containers

```bash
$ cd docker-symfony && make install
```

After you've edited your hosts file, which is in `/etc/hosts` to add that line

```bash
127.0.0.1 www.changeme.local
```

You should have your brand new Symfony application run at [http://www.changeme.local](http://www.changeme.local)

## Customize it

### Change the access URL

You just have to change the nginx config file in `nginx/symfony.conf` and change the `server_name` line.

Rebuild your containers and restart them (i.e. `make reset`), edit your hosts files to match your new URL and that's all !
