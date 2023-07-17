variable "do_token" {
  description = "Digital Ocean Personal Access Token"
  type        = string
  default     = ""
}

variable "pub_key" {
  description = "SSH public key"
  type        = string
  default     = ""
}

variable "pvt_key" {
  description = "SSH private key"
  type        = string
  default     = ""
}


variable "ssh_fingerprint" {
   type        = string
   description = "SSH fingerprint"
   default     = ""
}

