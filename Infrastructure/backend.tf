# Intialized Backend here.
terraform {
  backend "s3" {
    # for personal
    # bucket = "harshvardhan-tfstate"
    bucket = "harshvardhan-tfstates"
    key    = "logs/terraform.tfstate"
    region = "us-west-2"
    # profile = "harsh"
    # profile = "harshvardhan"
  }
} 