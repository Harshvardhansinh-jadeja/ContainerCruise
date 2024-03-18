# resource "aws_ssm_parameter" "username" {
#   name = "/harshvardhan/sandbox/rds/username"
#   type = "SecureString"
#   value = var.username
# }

# resource "aws_ssm_parameter" "password" {
#   name = "/harshvardhan/sandbox/rds/password"
#   type = "SecureString"
#   value = var.password
# }


data "aws_ssm_parameter" "username" {
  name = "/harshvardhan/sandbox/rds/username"
}

data "aws_ssm_parameter" "password" {
  name = "/harshvardhan/sandbox/rds/password"
}

resource "aws_ssm_parameter" "endpoint" {
  name = "/harshvardhan/sandbox/rds/database_endpoint"
  type = "SecureString"
  value = module.harshvardhan-rds.endpoint
}

resource "aws_ssm_parameter" "url" {
  name = "/harshvardhan/sandbox/rds/DATABASE_URL"
  type = "SecureString"
#   value = "postgresql://${aws_ssm_parameter.username.value}:${aws_ssm_parameter.password.value}@${aws_ssm_parameter.endpoint.value}/auth"
  value = "postgresql://${data.aws_ssm_parameter.username.value}:${data.aws_ssm_parameter.password.value}@${aws_ssm_parameter.endpoint.value}/auth"
}