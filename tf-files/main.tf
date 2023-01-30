terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "to-do-list"{
      ami = "ami-0f9fc25dd2506cf6d"        
      instance_type = "t2.micro"
      security_groups = ["to-do-list-sg"]
      key_name = "ilknur13"
      tags = {
            Name = "Web server by TerraForm"
      }
}
output "my-public-ip"{
       value= aws_instance.instance.public_ip
}

resource "aws_security_group" "to-do-list-sg" {
  name        = "to-do-list-sg"
  description = "Allow TLS inbound traffic"


  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "to-do-list-sg"
  }
}