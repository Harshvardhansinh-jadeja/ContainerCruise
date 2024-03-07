module "harshvardhan-ngw" {
  source = "./modules/nat"
  name="harshvardhan-ngw"
  depends= module.harshvardhan-igw
  subnet =aws_subnet.harshvardhan-public-subnets[0].id
  eip= module.harshvardhan-eip.eip_id
  
}
