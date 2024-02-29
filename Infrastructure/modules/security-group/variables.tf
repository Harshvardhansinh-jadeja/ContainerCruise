variable "name" {
  type = string
}


variable "desc" {
  type = string
}
variable "vpc" {
  type = string
}

variable "ingress_rules" {
  nullable = true
}

variable "egress_rules" {
  nullable = true
}