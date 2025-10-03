output "db_host" {
  value = aws_db_instance.postgres.address
}

output "ecr_repo_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "frontend_bucket" {
  value = aws_s3_bucket.frontend.bucket
}

output "backend_ec2_ip" {
  value = aws_instance.backend.public_ip
}
