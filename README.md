# Apache Directory Service Dockerfile

## Run

```bash
docker run -d --name ldap \
       -p 10389:10389 \
       -p 10636:10636 \
       quasiris/apacheds
```

## Run with mounted instance

```bash
docker run -d --name ldap \
       -p 10389:10389 \
       -p 10636:10636 \
       -v ~/apacheds:/var/lib/apacheds \
       quasiris/apacheds
```

## Build

```bash
docker build -t quasiris/apacheds .
```