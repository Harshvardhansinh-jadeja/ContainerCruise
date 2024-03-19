remote_state {
  backend = "s3"
  generate = {
    path      = "backends.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "harshvardhan-terragrunt"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-west-2"
    profile = "harshvardhan"
  }
}


generate "provider" {
  path = "mains.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    region = "us-west-2"
    profile="harshvardhan"
  }
EOF
}


