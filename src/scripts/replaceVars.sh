#! /bin/bash

# Reemplaza las variables del fichero 'mumble-server.ini.tmp' por sus valores,
# se genera el fichero 'mumble-server.ini' y se borra el antiguo fichero

envsubst < /etc/mumble-server.ini.tmp > /etc/mumble-server.ini && \
rm /etc/mumble-server.ini.tmp
