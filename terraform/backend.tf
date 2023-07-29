terraform {
  backend "s3" {
    bucket         = "opsbuy-s3-bucket-01"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "opsbuy-s3-bucket-01-lock-table"
    encrypt        = true
  }
}

