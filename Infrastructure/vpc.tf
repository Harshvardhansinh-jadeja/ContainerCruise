module "harshvardhan-vpc" {
  source = "./modules/vpc"
  name = "harshvardhan-vpc"
  cidr = "10.0.0.0/16"
}