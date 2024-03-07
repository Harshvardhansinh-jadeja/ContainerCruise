module "harshvardhan-eip" {
  source = "./modules/eip"

  name = "harshvardhan-eip"
  depends = module.harshvardhan-igw
}