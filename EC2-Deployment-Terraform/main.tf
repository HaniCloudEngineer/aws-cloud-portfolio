terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_first_instance" {
  ami           = "ami-0c02fb55956c7d316"   # Amazon Linux
  instance_type = "t3.micro"

  tags = {
    Name = "MyFirstTerraformInstance"
  }
}