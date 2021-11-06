# homeassistant-docker

Homeassistant in a container.

## Configuration

Variables in `/etc/homeassistant.conf` (on the host server) allow these settings to be customised:

1. homeassistant version
2. directory to mount from the host
3. timezone setting
4. extra configuration for Z-Wave... etc

### ha_version

The version of the homeassistant image to pull down and then build the container with.
Example:

```
ha_version=2021.10.0
```

It is normally fine to leave the default setting as-is.

### ha_image

The homeassistant image name. Example:

```
ha_image=ghcr.io/home-assistant/home-assistant
```

An alternative location at docker hub would be `homeassistant/home-assistant`

The default setting should not be changed.

### ha_hostname

The hostname given to the container, so that when you docker exec in its obvious which container you are on.
Example:

```
ha_hostname=homeassistant
```

### ha_config

The location of the homeassistant configuration on the *HOST* system.
Example:

```
ha_config=/homeassistant/config
```

### ha_tz

The timezone to set inside in the container.
Example:

```
ha_tz=Europe/Dublin
```

It should be something like: Australia/Melbourne...etc

See: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

### ha_extra_config

A way to pass in extra configuration to homeassistant; e.g. "--device /dev/ttyUSB0:/dev/ttyUSB0",
"--device /dev/ttyACM0:/dev/ttyACM0", "-v /etc/letsencrypt:/etc/letsencrypt:ro"...etc
Example:

```
ha_extra_config="-v /etc/letsencrypt:/etc/letsencrypt:ro"
```

## Quickstart

```
$ homeassistant-docker settings
...
$ homeassistant-docker pull
$ homeassistant-docker create
...
$ homeassistant-docker start
$ homeassistant-docker logs
...
$ homeassistant-docker stop
...
$ homeassistant-docker delete
```

The pull and create should only be done once per version bump.
After that the container can be started and stopped as required.

## Upgrade

After installing or updating `homeassistant-docker`:

1. homeassistant-docker stop
2. homeassistant-docker pull
3. docker rename homeassistant homeassistant-2021.9.7
4. homeassistant-docker create
5. homeassistant-docker start

Optional - to remove an old image and/or container:

6. docker rm homeassistant-2021.9.7
7. docker rmi ghcr.io/home-assistant/home-assistant:2021.9

## OpenRC

To have the container start automatically:

```
rc-config add homeassistant
```

## Logging

The default docker "json-file" logging driver does *not* do log rotation.

To select the "local" driver, with a max file size of 10MB and four files, add this to `/etc/docker/daemon.json`:

```json
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m",
    "max-file": "4"
  }
}
```

## References

1. https://wiki.gentoo.org/wiki/Docker
2. https://www.home-assistant.io/installation/linux#install-home-assistant-container
3. https://github.com/home-assistant/core/pkgs/container/home-assistant/versions
4. https://hub.docker.com/r/homeassistant/home-assistant
5. https://community.home-assistant.io/t/gentoo-homeassistant-0-59-2-ebuild/35577
