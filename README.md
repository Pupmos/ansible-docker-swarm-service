# Ansible

An ansible playbook for deploying services on a Docker swarm cluster.

## Prerequisites

- [Python3](https://realpython.com/installing-python)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

_Ideally ansible should be installed via [pip](https://pip.pypa.io/en/stable/), the package installer for python._

## Assumptions

This README assumes that you've already installed `debian` or `ubuntu` onto the target environment/s.

## Ansible

### Setup

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
