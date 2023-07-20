resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-18-04-x64"
  name = "www-1"
  region = "lon1"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    "92:05:38:58:d2:b1:c7:b3:ac:ad:b1:15:58:34:0b:b3"
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
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}
