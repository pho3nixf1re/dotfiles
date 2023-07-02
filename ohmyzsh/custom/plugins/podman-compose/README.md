# podman-compose

This plugin provides aliases for
[podman-compose](https://github.com/containers/podman-compose). It is a podman
version of the `docker-compose` plugin.

To use it, add podman-compose to the plugins array of your zshrc file:

```zsh
plugins=(... podman-compose)
```

## Aliases

| Alias     | Command                        | Description                                                                      |
|-----------|--------------------------------|----------------------------------------------------------------------------------|
| dco       | `podman-compose`               | Docker-compose main command                                                      |
| dcb       | `podman-compose build`         | Build containers                                                                 |
| dce       | `podman-compose exec`          | Execute command inside a container                                               |
| dcps      | `podman-compose ps`            | List containers                                                                  |
| dcrestart | `podman-compose restart`       | Restart container                                                                |
| dcrm      | `podman-compose rm`            | Remove container                                                                 |
| dcr       | `podman-compose run`           | Run a command in container                                                       |
| dcstop    | `podman-compose stop`          | Stop a container                                                                 |
| dcup      | `podman-compose up`            | Build, (re)create, start, and attach to containers for a service                 |
| dcupb     | `podman-compose up --build`    | Same as `dcup`, but build images before starting containers                      |
| dcupd     | `podman-compose up -d`         | Same as `dcup`, but starts as daemon                                             |
| dcupdb    | `podman-compose up -d --build` | Same as `dcup`, but build images before starting containers and starts as daemon |
| dcdn      | `podman-compose down`          | Stop and remove containers                                                       |
| dcl       | `podman-compose logs`          | Show logs of container                                                           |
| dclf      | `podman-compose logs -f`       | Show logs and follow output                                                      |
| dcpull    | `podman-compose pull`          | Pull image of a service                                                          |
| dcstart   | `podman-compose start`         | Start a container                                                                |
| dck       | `podman-compose kill`          | Kills containers                                                                 |
