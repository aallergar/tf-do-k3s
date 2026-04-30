# Terraform config to launch Rancher 2 on a k3s cluster

Based on [axeal/tf-do-rke2](https://github.com/axeal/tf-do-rke2) — same architecture, same DigitalOcean setup, adapted for k3s.

## Summary

This Terraform setup will:

- Start `count_server_nodes` amount of k3s server node droplets
- Start `count_agent_nodes` amount of k3s agent node droplets
- Create a load balancer pointing at the server droplets for ports 80, 443, and 6443
- Install k3s on the first server node (with `--cluster-init` for embedded etcd HA when `count_server_nodes > 1`)
- Install k3s on the other server nodes and join them to the cluster via the load balancer
- Install k3s on the agent nodes and join them to the cluster via the load balancer
- Install the cert-manager helm chart
- Install the Rancher helm chart according to the version specified in `rancher_version` using the helm repository specified in `rancher_chart_repo` if specified (or falling back to rancher-latest)

## Options

All available options/variables are described in [terraform.tfvars.example](terraform.tfvars.example).

## SSH Config

**Note: set the appropriate user for the images in the terraform variables, default is `root`**

You can use the auto-generated `ssh_config` file to connect to the droplets by droplet name, e.g. `ssh <prefix>-server-0`. Two options:

1. Add an `Include` directive at the top of `~/.ssh/config`, e.g. `Include ~/git/tf-do-k3s/ssh_config`.
2. Pass the file explicitly: `ssh -F ~/git/tf-do-k3s/ssh_config <host>`.

## How to use

- Clone this repository
- Copy `terraform.tfvars.example` to `terraform.tfvars` and edit (see inline comments)
- Run `terraform apply`
