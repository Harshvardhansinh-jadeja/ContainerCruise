terraform {
  backend "s3" {
    bucket = "harshvardhan-tfstate"
    key = "logs/terraform.tfstate"
    region =  "us-west-2"
    profile = "harsh"
  }
} 