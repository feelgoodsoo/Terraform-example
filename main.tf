terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 1.0.4"
    }
  }
}

variable "vm_set" {
  type = map  
  default = {
  img_name = "ami-01123b84e2a4fba05"
  vm_name = "MyInstance"
  instance_type = "t2.micro"
  key_name = "first-vm-key"
  }
    
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "web" {
  ami = var.vm_set.img_name
  key_name = var.vm_set.key_name
  instance_type = var.vm_set.instance_type
  root_block_device {
    volume_size = 8
  }
  tags = {
    Name = var.vm_set.vm_name
  }
}

