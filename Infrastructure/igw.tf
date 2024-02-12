resource "aws_internet_gateway" "harshvardhan-igw" {
  vpc_id = aws_vpc.harshvardhan-vpc.id
  tags = {
    Name = "harshvardhan-igw"
  }
}