#!/bin/bash

BASEDIR=$(dirname "$0")
VPN_NAME="${1-vpn}"
export VPN_NAME
echo "Connecting to VPN $VPN_NAME"
mkfifo $BASEDIR/saml-url || echo "Reusing existing named pipe"
xargs -a <(tail -f $BASEDIR/saml-url) -I '{}' -n 1 xdg-open '{}'&
(cd $BASEDIR && docker-compose up)