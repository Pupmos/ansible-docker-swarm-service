# RPC

## Launch

To launch a new service, run:

```console
CHAIN_ID=<chain_id> \
IMAGE=<image> \
REPLICAS=<replicas> \
SNAPSHOT_URL=<snapshot_url> \
SERVICE_TYPE=<service_type> \
NODE=<worker_node> \
make launch
```

where:

| Param            | Description                                                                                                                | Required |
|------------------|----------------------------------------------------------------------------------------------------------------------------|----------|
| `<chain_id>`     | The Chain ID.                                                                                                              | `true`   |
| `<image>`        | The [Kennel](https://github.com/Pupmos/kennel) Docker image to use.                                                        | `true`   |
| `<replicas>`     | The number of replicas to spawn (defaults to `1`).                                                                         | `false`  |
| `<snapshot_url>` | URL of the snapshot to use. Will attempt to use state sync if not supplied.                                                | `false`  |
| `<service_type>` | The service type (`rpc`).                                                                                                  | `true`   |
| `<worker_node>`  | The worker (compute) node to schedule the container/s on. Supply the node name as per what it was setup on the swarm with. | `false`  |

e.g.:

```console
CHAIN_ID=juno-1 \
IMAGE=ghcr.io/pupmos/juno:v11.0.0 \
REPLICAS=1 \
SNAPSHOT_URL=https://example.com/snapshot.tar.lz4 \
SERVICE_TYPE=rpc \
NODE=my-workier-node-1 \
make launch
```

## Upgrade

When upgrading a service ahead of a scheduled binary upgrade, please ensure you've pulled down the latest registry updates (in [group_vars/](group_vars)). Please also check that the updates contain the new version information.

To upgrade a service, run:

```console
CHAIN_ID=<chain_id> \
IMAGE=<image> \
SERVICE_TYPE=<service_type> \
NODE=<worker_node> \
make upgrade
```

where:

| Param            | Description                                                                                                                | Required |
|------------------|----------------------------------------------------------------------------------------------------------------------------|----------|
| `<chain_id>`     | The Chain ID.                                                                                                              | `true`   |
| `<image>`        | The updated [Kennel](https://github.com/Pupmos/kennel) Docker image to use.                                                | `true`   |
| `<service_type>` | The service type (`rpc`).                                                                                                  | `true`   |
| `<worker_node>`  | The worker (compute) node to schedule the container/s on. Supply the node name as per what it was setup on the swarm with. | `false`  |

e.g.:

```console
CHAIN_ID=juno-1 \
IMAGE=ghcr.io/pupmos/juno:v11.0.0 \
SERVICE_TYPE=rpc \
NODE=my-workier-node-1 \
make upgrade
```
