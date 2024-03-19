remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
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
  path = "main.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::831794387446:role/OIDC_Connect"
  }
}
EOF
}

terraform{
  source = "../modules/ec2"
}