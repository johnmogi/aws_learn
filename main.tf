terraform {
    cloud {
    organization = "1digital"
    workspaces {
      name = "weightapp_ws"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_vpc" "weightapp_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-weightapp"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.weightapp_vpc.id
}


resource "aws_subnet" "weightapp_subnet" {
  vpc_id            = aws_vpc.weightapp_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-weightapp"
  }
}

resource "aws_network_interface" "wa-interface" {
  subnet_id   = aws_subnet.weightapp_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "wa_front" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"
  key_name = "deployer-key"

  network_interface {
    network_interface_id = aws_network_interface.wa-interface.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDD3YqYxXxeZy5966tARrDtOqkjxhkQuise5RJyXsTs67PB1TPsszf76FsIZLQQABywMPC//tNWi3EF+49Iw1c/AiplS28Iq3rlW/xRRrRqvZuhwOco3DW2R1usvae0EjugC98X+LmMEBrZvaX9RFas0F0oqX4U2pcLfBNjVwxn9d1TeaPU6KYVvX2rJrY9EKjmEpH0G9N3jide+3H5mdRdipfwwGb4n9hdefbJ89f2q7VksQIJEYtsnAXYL1yWqL05Ikl1n+APqwBe59ZOZp2zKyV1JYV7x7EfgNXdfI/F6tTqX0WWZJRB5OES/Wxla5Z8wXpAnyEKncE2Rv9WgFEJW4+qzhJBlx0HeNozwME185g8HZQh7gWzrQuUQzzYgIBKBtPAGQKTmAsksLwIQ5qDfbzvkp0ZcXd/E2vloySmTxxOT/kZgargkSU8orbRozfnp8px9Dd0HavrZ0UGb9/uf4WwEgkghPRzxEKlNR89boUzPkbhkrFsSeW/KH2OEqU= john@john-Z370P-D"
}