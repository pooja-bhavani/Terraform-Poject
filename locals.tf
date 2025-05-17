locals {
  env_config = {
    dev = {
      ec2_count = 1
      s3_count  = 1
    }
    stg = {
      ec2_count = 1
      s3_count  = 1
    }
    prod = {
      ec2_count = 3
      s3_count  = 2
    }
  }
}