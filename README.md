# homeassistant-docker

Homeassistant in a container.

## Configuration

Variables in `/etc/homeassistant.conf` (on the host server) allow these settings to be customised:

1. homeassistant version
2. directory to mount from the host
3. timezone setting
4. extra configuration for Z-Wave... etc

## Quickstart

```
$ homeassistant-docker settings
...
$ homeassistant-docker pull
$ homeassistant-docker create
$ homeassistant-docker start
$ homeassistant-docker logs
...
$ homeassistant-docker stop
...
$ homeassistant-docker delete
```

## OpenRC

To have the container start automatically:

```
rc-config add homeassistant
```

## References

1. https://wiki.gentoo.org/wiki/Docker
2. https://www.home-assistant.io/installation/linux#install-home-assistant-container
3. https://github.com/home-assistant/core/pkgs/container/home-assistant/versions
4. https://hub.docker.com/r/homeassistant/home-assistant
5. https://community.home-assistant.io/t/gentoo-homeassistant-0-59-2-ebuild/35577
