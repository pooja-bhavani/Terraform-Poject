provider "aws" {
  region = var.region
}

# EC2 Instances
resource "aws_instance" "ec2" {
  count         = local.env_config[terraform.workspace].ec2_count
  ami           = "ami-06e753fac3cb1f27f"
  instance_type = var.instance_type
  tags = {
    Name = "${terraform.workspace}-ec2-${count.index + 1}"
    Environment = terraform.workspace
  }
}

# S3 Buckets
resource "aws_s3_bucket" "bucket" {
  count  = local.env_config[terraform.workspace].s3_count
  bucket = "${terraform.workspace}-bucket-${count.index + 1}-${random_string.suffix.result}"
  tags = {
    Name = "${terraform.workspace}-bucket-${count.index + 1}"
    Environment = terraform.workspace
  }
}

# DynamoDB Table
resource "aws_dynamodb_table" "table" {
  name           = "${terraform.workspace}-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  
  attribute {
    name = "id"
    type = "S"
  }
  
  tags = {
    Name = "${terraform.workspace}-dynamodb"
    Environment = terraform.workspace
  }
}

# Random string to ensure S3 bucket name uniqueness
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}