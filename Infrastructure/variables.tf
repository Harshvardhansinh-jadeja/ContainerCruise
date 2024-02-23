variable "profile" {
  type = string
  # default = "harsh" 
}
variable "region" {
  type = string
  # default = "us-west-2"
  sensitive = true
}

variable "container-port" {
  type = number
  default = 3000
  
}

variable "anywhere" {
  default = "0.0.0.0/0"
}
variable "account_id" {
  # default = 831794387446
  # default = 471112736114
  sensitive = true
}
variable "local-image" {
  type = string
  # default = "containercruise"
  default = "authcontainer"
}

# we used this because it was giving me error when we give container name which contains slash
variable "container-name" {
  type = string
  default = "authcontainer"
  # default = "containercruise"
}

variable "username" {
  type = string
  sensitive = true
}

variable "password" {
  type = string
  sensitive = true
}

variable "db_port" {
  type = number
  default = 5432
}
locals {
  repo_url= aws_ecr_repository.harshvardhan-repo.name
}