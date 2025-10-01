output "s3_bucket" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "ecr_repo_url" {
  value = aws_ecr_repository.my_repo.repository_url
}
