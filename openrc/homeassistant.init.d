#!/sbin/openrc-run
# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Homeassistant in a container"

depend() {
    need net docker
}

start() {
    ebegin "Starting Homeassistant container"
    /usr/bin/homeassistant-docker start
    eend $?
}

stop() {
    ebegin "Stopping Homeassistant container"
    /usr/bin/homeassistant-docker stop
    eend $?
}
