
resource "aws_vpc" "harshvardhan-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "harshvardhan-vpc"
  }
}   