data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_key_pair" "this" {
  key_name   = "fmt-keypar"
  public_key = file("./fmt-keypair.pub")

}



resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  count         = 4
  user_data     = <<-EOF
                #! /bin/bash
                sudo apt update  \
                curl https://releases.rancher.com/install-docker/19.03.sh | sh \
                usermod -aG docker ubuntu
                EOF
  key_name      = aws_key_pair.this.key_name



  tags = {
    Name        = "server-${count.index}"
    Environmnet = var.env
    Provisioner = "Terraform"
    Repo        = var.repo
  }



}




