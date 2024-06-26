terraform{
  backend "s3" {
    bucket = "gh-s3-demo-123"
    key = "gh/terraform.tfstate"
    region = "ap-south-1"
  # dynamodb_table = "terraform-lock"
  }
}

############# not working  .It is giving the issue.