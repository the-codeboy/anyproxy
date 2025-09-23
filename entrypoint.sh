#!/bin/sh

for var in VPN_PASS VPN_USER VPN_SERVER; do
    eval value=\$$var
    if [ -z "$value" ]; then
        echo "Error: $var is not set"
        exit 1
    fi
done

echo "Starting OpenConnect..."

tinyproxy &

printf '%s\n' "$VPN_PASS" | exec openconnect \
    --useragent=AnyConnect \
    --no-external-auth
    --user="$VPN_USER" \
    --passwd-on-stdin \
    ${VPN_GROUP:+--authgroup="$VPN_GROUP"} \
    ${VPN_TOKEN:+--token-mode=totp --token-secret=base32:"$VPN_TOKEN"} \
    "$VPN_SERVER"