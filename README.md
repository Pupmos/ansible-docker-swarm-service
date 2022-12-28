# Pupmos/ansible-docker-swarm-service

An Ansible playbook for Docker Swarm services.

## Prerequisites

- [Python3](https://realpython.com/installing-python)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

_Ideally ansible should be installed via [pip](https://pip.pypa.io/en/stable/), the package installer for python._

## Assumptions

This README assumes that you've already installed `debian` or `ubuntu` onto the target environment/s.

## Setup

1. Install the required git submodule dependencies:

```console
git submodule update --init
```

2. Install the ansible `community.general` collection:

```console
ansible-galaxy collection install community.general
```

3. Rename the `hosts.example` file in `inventory/` to `hosts`:

```console
cp inventory/hosts.example inventory/hosts
```

## Types

The following service types are supported:

- [RPC](RPC.md)
- [Proxy](PROXY.md)

## Known Issues

* When an RPC service is upgraded, the proxy service has to be re-deployed. This is a bug with how internal DNS lookups are performed/cached.
