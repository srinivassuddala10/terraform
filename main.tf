provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-08c40ec9ead489470" # Amazon Linux 2 AMI (check region)
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformEC2"
  }
}

