# jitsi-prosody
Prosody server for jitsi-meet infrastructure

Configuration options:

- XMPP_DOMAIN - the domain name of prosody XMPP virtualhost (default "example.com")
- VIDEOBRIDGE_SECRET (string) - secret for jitsi-videobridge external component
- FOCUS_SECRET (string) - secret for jitsi focus (jicofo) external component

e.g.:

```
docker run -d \
    -e XMPP_DOMAIN=myhost.com \
    -e FOCUS_SECRET=kab5Yuc2phunn6Ik \
    -e VIDEOBRIDGE_SECRET=iC1doM3eC1celK9E \
    -p 55222:5222 \
    -p 55269:5269 \
    -p 55281:5281 \
    -p 55347:5347 yulis/jitsi-prosody
```

will run prosody server for "myhost.com" domain with c2s port mapped to host's 55222, s2s port mapped to 55269, HTTPS port mapped to 55281 and XEP-0114 port mapped to 55347
