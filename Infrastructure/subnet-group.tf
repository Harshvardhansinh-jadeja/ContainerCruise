module "harshvardhan-sub-group" {
  source  = "./modules/subnet-group"
  subnets = [aws_subnet.harshvardhan-private-subnets[0].id, aws_subnet.harshvardhan-private-subnets[1].id, aws_subnet.harshvardhan-private-subnets[2].id]
  name    = "${var.environment}-sub-group"

}