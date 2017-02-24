#!/bin/bash
SCRIPT_PATH=`dirname $0`
ABSOLUTE_PATH=`readlink -m ${SCRIPT_PATH}`

OPENVPN_PORT=1432

docker run \
    -p $OPENVPN_PORT:$OPENVPN_PORT/udp \
    -p 443:443/tcp \
    -p 8080:8080/tcp \
    --cap-add=NET_ADMIN \
    --device=/dev/net/tun \
    -v $ABSOLUTE_PATH/etc/openvpn:/etc/openvpn \
    -it cent/openvpn run
