# Deptrac via docker

This project is based on https://github.com/sensiolabs-de/deptrac, so credits go to them! For bugs in deptrac contact them. For any issues with this docker image go a head and contact me via https://github.com/ohartl/docker-deptrac/issues

## Run deptrac

Mount your project directory to the `/app` volume

```bash
docker run --rm -v $PWD:/app ohartl/deptrac

# which is equivalent to
docker run --rm -v $PWD:/app ohartl/deptrac analyze
```

## Initializing a deptrac project?

No problem, you can just pass any of the deptrac commands at the end.

```bash
docker run --rm -v $PWD:/app ohartl/deptrac init
```

