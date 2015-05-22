VirtualHost "XMPP_DOMAIN"
        -- enabled = false -- Remove this line to enable this host
        authentication = "anonymous"

        -- Assign this host a certificate for TLS, otherwise it would use the one
        -- set in the global section (if any).
        -- Note that old-style SSL on port 5223 only supports one certificate, and will always
        -- use the global one.
        ssl = {
                key = "/etc/prosody/certs/XMPP_DOMAIN.key";
                certificate = "/etc/prosody/certs/XMPP_DOMAIN.crt";
        }
        -- we need bosh
        modules_enabled = {
            "bosh";
            "pubsub";
        }

Component "conference.XMPP_DOMAIN" "muc"
admins = { "focus@auth.XMPP_DOMAIN" }

Component "jitsi-videobridge.XMPP_DOMAIN"
    component_secret = "VIDEOBRIDGE_SECRET"

VirtualHost "auth.XMPP_DOMAIN"
        authentication = "internal_hashed"

Component "focus.XMPP_DOMAIN"
    component_secret = "FOCUS_SECRET"