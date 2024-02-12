resource "aws_subnet" "harshvardhan-private-subnet" {
  vpc_id = aws_vpc.harshvardhan-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-west-2a"
   tags = {
    Name = "harshvardhan-private-subnet"
  }
}
resource "aws_subnet" "harshvardhan-private-subnet-2" {
  vpc_id = aws_vpc.harshvardhan-vpc.id
  cidr_block = "10.0.1.0/24"
   availability_zone = "us-west-2b"
   tags = {
    Name = "harshvardhan-private-subnet-2"
  }
}

resource "aws_subnet" "harshvardhan-public-subnet" {
  vpc_id = aws_vpc.harshvardhan-vpc.id
  cidr_block = "10.0.2.0/24"
   availability_zone = "us-west-2a"
   tags = {
    Name = "harshvardhan-public-subnet"
  }
  map_public_ip_on_launch = true
}
resource "aws_subnet" "harshvardhan-public-subnet-2" {
  vpc_id = aws_vpc.harshvardhan-vpc.id
  cidr_block = "10.0.3.0/24"
   availability_zone = "us-west-2b"
   tags = {
    Name = "harshvardhan-public-subnet-2"
  }
  map_public_ip_on_launch = true
}
