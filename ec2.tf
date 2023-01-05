resource "aws_instance" "server" {
    ami = var.ami
    instance_type = var.instance_type

    tags = {
        Name = var.name
        Environmnet = var.env
        Provisioner = "Terraform"
        Repo = var.source
    }
}