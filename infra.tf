resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

#####################
# S3 Bucket
#####################
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-tf-bucket-${random_string.suffix.result}"

  tags = {
    Name = "MyTerraformBucket"
  }
}

#####################
# RDS PostgreSQL
#####################
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow PostgreSQL inbound traffic"
  vpc_id      = "vpc-xxxxxx"   # ⚠️ Replace with real VPC

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # restrict in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = ["subnet-xxxx", "subnet-yyyy"] # ⚠️ Replace

  tags = {
    Name = "RDS subnet group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier           = "my-postgres-db"
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "admin"
  password             = "Admin12345!"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible  = true
  skip_final_snapshot  = true
}

#####################
# ECR Repository
#####################
resource "aws_ecr_repository" "my_repo" {
  name = "my-docker-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "MyAppECR"
  }
}
