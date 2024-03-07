
module "harshvardhan-igw" {
  source = "./modules/igw"
  vpc= module.harshvardhan-vpc.vpc_id
  name = "harshvardhan-igw"
}