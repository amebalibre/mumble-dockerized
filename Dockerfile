FROM debian:stable

MAINTAINER amebalibre <ameba@autistici.org>

ENV MUM_MAX_USERS="100"
ENV MUM_TEXT_MSG_LENGTH="5000"
ENV MUM_IMAGE_MSG_LENGTH="131072"
ENV MUM_ALLOW_HTML="true"
ENV MUM_WELCOME_TEXT="<br />Bienvenidos a <b>Murmur</b>.<br />Diviertete!<br />"

RUN apt-get -y update && \
    apt-get -y install gettext-base mumble-server

ADD ./src/config/mumble-server.ini /etc/mumble-server.ini.tmp
ADD ./src/scripts/replaceVars.sh /tmp/replaceVars.sh

RUN ["/bin/bash", "/tmp/replaceVars.sh"]

VOLUME ["/var/log/mumble-server/", "/var/lib/mumble-server/"]

EXPOSE 64738/udp

USER mumble-server
ENTRYPOINT ["/usr/sbin/murmurd", "-ini", "/etc/mumble-server.ini", "-fg"]
