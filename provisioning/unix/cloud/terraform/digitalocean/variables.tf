variable "ansible_playbook" {
  type        = string
  description = "Path to the Ansible Playbook"
  default     = "../../../../../ansible/playbook.yml"
}

variable "do_token" {
  type        = string
  description = "Your DigitalOcean Personal Access Token (Read & Write)"
}

variable "ssh_key_fingerprints" {
  type        = list(string)
  description = "List of SSH Key fingerprints"
}

variable "pub_key" {
  type        = string
  description = "Local Path To Your SSH Public Key"
}

variable "pvt_key" {
  type        = string
  description = "Local Path To Your SSH Private Key"
}

variable "region" {
  type        = string
  description = "Region in which to deploy the cluster. Default is fra1 (Frankfurt, Germany)"
  default     = "fra1"
  validation {
    condition     = length(regexall("^nyc1|sfo1|nyc2|ams2|sgp1|lon1|nyc3|ams3|fra1|tor1|sfo2|blr1|sfo3$", var.region)) > 0
    error_message = "Invalid region. Valid regions are nyc1, sfo1, nyc2, ams2, sgp1, lon1, nyc3, ams3, fra1, tor1, sfo2, blr1 or sfo3."
  }
}

variable "server_size" {
  type        = string
  description = "Server droplet size. e.g. s-1vcpu-1gb"
  default     = "s-1vcpu-1gb" # prod = s-1vcpu-2gb
}
