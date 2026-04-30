variable "do_token" {
  default = "xxx"
}

variable "prefix" {
  default = "yourname"
}

variable "count_server_nodes" {
  default = "1"
}

variable "count_agent_nodes" {
  default = "0"
}

variable "region" {
  default = "lon1"
}

variable "server_size" {
  default = "s-4vcpu-8gb"
}

variable "agent_size" {
  default = "s-2vcpu-4gb"
}

# k3s version to install, e.g. "v1.31.4+k3s1". Leave empty for latest stable.
variable "k3s_version" {
  default = ""
}

variable "image" {
  default = "ubuntu-22-04-x64"
}

variable "user" {
  default = "root"
}

variable "ssh_keys" {
  default = []
}

# Optional: set to a Rancher Prime Helm repository URL to use the Prime chart.
# Falls back to rancher-latest when empty.
variable "rancher_chart_repo" {
  default = ""
}

variable "rancher_version" {
  default = "v2.10.2"
}

variable "admin_password" {
  default = "adminadminadmin"
}
