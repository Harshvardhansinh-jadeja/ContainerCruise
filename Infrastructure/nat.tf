resource "aws_nat_gateway" "harshvardhan-ngw" {
  allocation_id = aws_eip.harshvardhan-eip.id
  subnet_id     = aws_subnet.harshvardhan-public-subnets[0].id

  tags = {
    Name = "harshvardhan-ngw"
  }
  depends_on = [aws_internet_gateway.harshvardhan-igw]
}
