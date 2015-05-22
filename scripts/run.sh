#!/bin/bash

# Create new XMPP domain config
sed -e "s/XMPP_DOMAIN/$XMPP_DOMAIN/g" \
    -e "s/VIDEOBRIDGE_SECRET/$VIDEOBRIDGE_SECRET/g" \
    -e "s/FOCUS_SECRET/$FOCUS_SECRET/g" \
    /etc/prosody/conf.d/host.cfg.lua.tmpl > "/etc/prosody/conf.d/$XMPP_DOMAIN.cfg.lua"

# Setup dummy keys
ln -sf /etc/prosody/certs/localhost.key  /etc/prosody/certs/$XMPP_DOMAIN.key
ln -sf /etc/prosody/certs/localhost.crt /etc/prosody/certs/$XMPP_DOMAIN.crt

exec prosodyctl start