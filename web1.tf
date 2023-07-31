resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-18-04-x64"
  name = "www-1"
  region = "lon1"
  size = "s-1vcpu-1gb"
  ipv4_address = "68.183.254.49"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  
  provisioner "remote-exec" {
    inline = [
      # install nginx
      "sudo apt update -y"

    ]
  }
}
