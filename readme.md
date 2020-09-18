
# Docker Registry for Local Cache & what-not :)

## Steps to bring this thing up;

- First, initialize proper self-signed certificate: `sh mkcert.sh localhost`
  Replace `localhost` with your desired hostname/dnsname.

- Then bring up using `docker-compose`: `HOSTNAME=localhost docker-compose up -d`
  This initializes required components. Replace `localhost` with your external
  IP address or hostname.

- Bonus: Put your own SSL/TLS certificates (replacing `ssl.crt` and `ssl.key`),
  to have proper setup. :)

## Setup your desired (local) environment.

Add your server's IP or hostname to `insecure-registries`:

- Edit `daemon.json` of your docker daemon.
  - `/etc/docker/daemon.json` in most Linux machines (create if not exists)
  - `~/.docker/daemon.json` on Mac OSX or macOS

Add this to your daemon configration:

```"insecure-registries": [ "{_your_ip_or_hostname_}" ]```

Which entire file will look like;

```
{
	"experimental": false,
	"insecure-registries": [
		"my-external.example.com",
		"127.0.0.1"
	]
}
```

## Login to 'fake'/silly authentication

Execute `docker login 127.0.0.1 -u silly -p silly` (replacing 127.0.0.1 with
your hostname or IP)

Then you can use `docker pull` and `docker push` commands to do stuff.

For example, since registry is a mirror, you can pull `busybox` via:
`docker pull 127.0.0.1/library/busybox` (replacing 127.0.0.1 with your hostname
or IP) this will pull image to registry then provide to you. Subsequent pulls
will use registry as a cache server...
