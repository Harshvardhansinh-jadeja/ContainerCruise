module "harshvardhan-vpc" {
  source = "./modules/vpc"
  name = "${var.environment}-vpc"
  cidr = "10.0.0.0/16"
}