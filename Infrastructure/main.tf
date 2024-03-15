provider "aws" {
  # profile = "harshvardhan"
  region = var.region
  # you can use multiple accounts to access this infastructure using this
  # allowed_account_ids = 
}


data "aws_iam_role" "task_exec-role" {
  //for personal
  name = "ecsTaskExecutionRole"
  //for sandbox
  # name = "AmazonECSTaskExecutionRole"
}
