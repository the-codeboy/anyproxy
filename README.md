# AnyProxy

A proxy for Cisco AnyConnect VPNs running in a Docker container. This project combines OpenConnect with TinyProxy to provide a simple way to access resources behind a Cisco AnyConnect VPN through a proxy server.

## Features

- Runs Cisco AnyConnect compatible VPN client (OpenConnect) in a container
- Provides HTTP(S) proxy access through TinyProxy
- Supports TOTP-based multi-factor authentication
- Small Alpine Linux-based image (~30MB)

## Prerequisites

- Docker
- Docker Compose (optional, for local building)
- Cisco AnyConnect VPN credentials

## Quick Start

Using the pre-built image from GitHub Container Registry:

```bash
docker run -d \
  --name anyproxy \
  --cap-add=NET_ADMIN \
  --device=/dev/net/tun \
  -p 8888:8888 \
  -e VPN_USER=your-username \
  -e VPN_PASS=your-password \
  -e VPN_SERVER=vpn.example.com \
  ghcr.io/the-codeboy/anyproxy:master
```

## Building Locally

1. Clone this repository:
```bash
git clone https://github.com/the-codeboy/anyproxy.git
cd anyproxy
```

2. Copy the example environment file and adjust the values:
```bash
cp .env.example .env
```

3. Build and start using Docker Compose:
```bash
docker compose up -d
```

## Configuration

Configure the following environment variables:

- `VPN_USER`: Username for VPN authentication
- `VPN_PASS`: Password for VPN authentication
- `VPN_SERVER`: AnyConnect VPN server address
- `VPN_GROUP`: (Optional) VPN group for connection
- `VPN_TOKEN`: (Optional) Base32 TOTP token for MFA

## Usage

The proxy will be available at `localhost:8888`

Configure your applications to use the proxy:
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

MIT License

Copyright (c) 2025 the-codeboy

Permission is hereby granted, free of charge, to any person obtaining a copy

of this software and associated documentation files (the "Software"), to deal

in the Software without restriction, including without limitation the rights

to use, copy, modify, merge, publish, distribute, sublicense, and/or sell

copies of the Software, and to permit persons to whom the Software is

furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all

copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR

IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,

FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE

AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER

LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,

OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

SOFTWARE.
