terraform {
  backend "s3" {
    bucket = "terraform-practice-bucket-345123423423"
    key    = "dj-practice/terraform/training-terraform/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}