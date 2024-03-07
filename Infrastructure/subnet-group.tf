module "harshvardhan-sub-group" {
  source = "./modules/subnet-group"
  subnets = [aws_subnet.harshvardhan-private-subnets[0].id, aws_subnet.harshvardhan-private-subnets[1].id]
  name = "harshvardhan-sub-group"
  
}