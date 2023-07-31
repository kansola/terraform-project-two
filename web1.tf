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
      "sudo apt update -y",
      "sudo apt install -qy git",
      "sudo apt install -qy openssh-server",
      "sudo sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd",
      "sudo mkdir -p /var/run/sshd",
      "sudo apt install -qy default-jdk",
      "sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt-key fingerprint 0EBFCD88",
      "sudo apt update -y",
      "sudo apt-get install docker-ce docker-ce-cli containerd.io -y",
      "sudo adduser --quiet jenkins",
      "echo \"jenkins:password\" | chpasswd",
      "mkdir /home/jenkins/",
      "COPY .ssh/authorized_keys /home/jenkins/.ssh/authorized_keys",
      "sudo chmod 700 ~/.ssh",
      "chmod 600 ~/.ssh/authorized_keys"



    ]
  }
}
