resource "aws_instance" "gen_ec2" {
  subnet_id = var.subnet_id
  ami = "ami-052c9ea013e6e3567"
  instance_type = "t2.micro"
#   taken directly from the console
  key_name = "harsh-key"
   tags = {
    name = var.name
  }
  vpc_security_group_ids = var.sg_ids
}