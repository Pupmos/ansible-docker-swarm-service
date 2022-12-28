# Proxy

## Setup

The proxy service expects a TLS certificate, as well as the corresponding private key to have been added to the swarm cluster prior to launching the service. These can be added by running (on one of your master swarm nodes):

```console
docker secret create ssl_certificate.pem /path/to/ssl_certificate.pem
docker secret create ssl_certificate_key.pem /path/to/ssl_certificate_key.pem
```

## Launch

To launch the service, run:

```console
SERVICE_ID=<service_id> \
IMAGE=<image> \
SERVICE_TYPE=<service_type> \
make launch
```

where:

| Param            | Description                                                         | Required |
|------------------|---------------------------------------------------------------------|----------|
| `<service_id>`   | The service identifier (`proxy`).                                   | `true`   |
| `<image>`        | The [Kennel](https://github.com/Pupmos/kennel) Docker image to use. | `true`   |
| `<service_type>` | The service type (`proxy`).                                         | `true`   |

e.g.:

```console
SERVICE_ID=proxy \
IMAGE=ghcr.io/pupmos/proxy:v0.3.1 \
SERVICE_TYPE=proxy \
make launch
```

The service will be launched on *all* worker nodes.

## Upgrade

To upgrade the service, run:

```console
SERVICE_ID=<service_id> \
IMAGE=<image> \
SERVICE_TYPE=<service_type> \
make upgrade
```

where:

| Param            | Description                                                                 | Required |
|------------------|-----------------------------------------------------------------------------|----------|
| `<service_id>`   | The service identifier (`proxy`).                                           | `true`   |
| `<image>`        | The updated [Kennel](https://github.com/Pupmos/kennel) Docker image to use. | `true`   |
| `<service_type>` | The service type (`proxy`).                                                 | `true`   |

e.g.:

```console
SERVICE_ID=proxy \
IMAGE=ghcr.io/pupmos/proxy:v0.3.2 \
SERVICE_TYPE=proxy \
make upgrade
```

The service will be upgraded on *all* worker nodes.
