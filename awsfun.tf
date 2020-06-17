provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  ami                    = "ami-0e34e7b9ca0ace12d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0fd8f262d44771138"]
  key_name               = "aws-fun"
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "1"
    volume_type = "gp2"
  }
  tags = {
    Name = "Hello AWS World"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.web.id
  vpc      = true
}