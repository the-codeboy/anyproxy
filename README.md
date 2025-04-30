# AnyProxy

A proxy for Cisco AnyConnect VPNs running in a Docker container. This project combines OpenConnect with TinyProxy to provide a simple way to access resources behind a Cisco AnyConnect VPN through a proxy server.

## Features

- Runs Cisco AnyConnect compatible VPN client (OpenConnect) in a container
- Provides HTTP(S) proxy access through TinyProxy
- Supports TOTP-based multi-factor authentication
- Small Alpine Linux-based image (~30MB)

## Prerequisites

- Docker
- Docker Compose
- Cisco AnyConnect VPN credentials

## Configuration

Copy the example environment file and adjust the values:

```bash
cp .env.example .env
```

Configure the following environment variables in `.env`:

- `VPN_USER`: Username for VPN authentication
- `VPN_PASS`: Password for VPN authentication
- `VPN_SERVER`: AnyConnect VPN server address
- `VPN_GROUP`: (Optional) VPN group for connection
- `VPN_TOKEN`: (Optional) Base32 TOTP token for MFA

## Usage

1. Build and start the container:

```bash
docker compose up -d
```

2. The proxy will be available at `localhost:8888`
3. Configure your applications to use the proxy:

   - Host: localhost
   - Port: 8888
   - Protocol: HTTP/HTTPS

## Troubleshooting

If the container fails to start:

1. Check if environment variables are properly set
2. Verify VPN credentials are correct
3. Ensure the container has the required capabilities (`NET_ADMIN`)
4. Check if `/dev/net/tun` device is available on the host

## License

TODO
