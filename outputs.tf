output "ec2_ids" {
  value = aws_instance.ec2[*].id
}

output "s3_bucket_names" {
  value = aws_s3_bucket.bucket[*].bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.table.name
}