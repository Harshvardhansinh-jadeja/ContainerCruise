variable "image-name" {
  type = string
  default = "nginxdemos/hello"
}

variable "profile" {
  default = "harsh"
}

variable "container-port" {
  type = number
  default = 80
}

variable "region" {
  type = string
  default = "us-west-2"
}

variable "task_role" {
  default = "arn:aws:iam::843728461002:role/AmazonECSTaskExecutionRole"
}

variable "anywhere" {
  default = "0.0.0.0/0"
}
variable "account_id" {
  default = 831794387446
  # default = 471112736114
}
variable "local-image" {
  default = "nginxdemos/hello"
}

variable "container-name" {
  default = "nginxdemos"
}