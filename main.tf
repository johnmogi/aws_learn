terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    #   version = "4.29.0"
      version = "3.74.0"
    }
  }

  required_version = ">= 1.2.0"
}


resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
