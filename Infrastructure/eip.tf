resource "aws_eip" "harshvardhan-eip" {
  domain   = "vpc"
  depends_on = [ aws_internet_gateway.harshvardhan-igw ]
  tags = {
    Name = "harshvardhan-EIP"
  }
}