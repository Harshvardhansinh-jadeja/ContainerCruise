resource "aws_instance" "harshvardhan-bastion" {
  subnet_id = aws_subnet.harshvardhan-public-subnet.id
  ami = "ami-052c9ea013e6e3567"
  instance_type = "t2.micro"
#   taken directly from the console
  key_name = "harsh-key"
   tags = {
    name = "harshvardhan-bastion"
  }
  vpc_security_group_ids = [ aws_security_group.harshvardhan-bastion-sg.id ]
}

output "bastion_public_IP" {
    value = aws_instance.harshvardhan-bastion.public_ip
}

# another way to create key pair 
# resource "tls_private_key" "rsa-4096-example" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "harshvardhan-key" {
#   key_name   = "harshvardhan-key"
#   public_key = tls_private_key.rsa-4096-example.public_key_openssh
# }