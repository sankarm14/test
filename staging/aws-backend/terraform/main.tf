module "backend_s3_bucket" {
  source  = "../../../_modules/s3"

  bucket = var.tfstateBucketName
  acl    = "private"

  tags = {
    Name        = var.tfstateBucketName,
    Environment = var.environment
  }

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "backend_dynamodb_table" {
  source  = "../../../_modules/dynamodb"

  name         = var.tfstateTableName
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]

  tags = {
    Name        = var.tfstateTableName,
    Environment = var.environment
  }
}