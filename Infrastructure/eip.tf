module "harshvardhan-eip" {
  source  = "./modules/eip"
  name    = "${var.environment}-eip"
  depends = module.harshvardhan-igw
}