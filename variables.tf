variable "region" {
  description = "Define what region the instance will be deployed"
  default     = "us-east-1"

}

variable "name" {
  description = "Name of application"
  default     = "server01"
}

variable "env" {
  description = "Environment of the application"
  default     = "prod"
}

variable "ami" {
  description = "AWS AMI to be used"
  default     = "ami-0b93ce03dcbcb10f6"
}

variable "instance_type" {
  description = "AWS Instance Type define the hardware configuration of the machine"
  default     = "t2.micro"
}

variable "repo" {
  description = "Repository of the application"
  default     = "github.com/jo316it/learning_terraform"
}
