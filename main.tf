provider "aws" {
  # profile = "harshvardhan-th"
  # profile = "admin"
  profile = var.profile
  region = var.region
}

# import {
#   to = aws_iam_role.taskExecution
#   id = "AmazonECSTaskExecutionRole"
# }

data "aws_iam_role" "task_exec-role" {
  name = "ecsTaskExecutionRole"
  # name = "AmazonECSTaskExecutionRole"
}

output "task-role" {
  value = data.aws_iam_role.task_exec-role.arn
}