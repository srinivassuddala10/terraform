provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-12345"
}

resource "aws_instance" "example" {
  ami           = "ami-08c40ec9ead489470" # Amazon Linux 2 AMI (check region)
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformEC2"
  }
}

