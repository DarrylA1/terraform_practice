resource "aws_s3_bucket" "terraform-practice-bucket-345123423423" {
    bucket = "terraform-practice-bucket-345123423423"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "terraform-practice-bucket-345123423423"
        Environment = "Test"
    }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.terraform-practice-bucket-345123423423.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}