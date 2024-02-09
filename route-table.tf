resource "aws_route_table" "harshvardhan-public-rt" {
  vpc_id = aws_vpc.harshvardhan-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.harshvardhan-igw.id
  }
  tags = {
    Name = "harshvardhan-public-rt"
  }
  
}

resource "aws_route_table" "harshvardhan-private-rt" {
  vpc_id = aws_vpc.harshvardhan-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.harshvardhan-ngw.id
  }
  tags = {
    Name = "harshvardhan-private-rt"
  }
}

resource "aws_route_table_association" "subnet-assoc-private" {
  subnet_id      = aws_subnet.harshvardhan-private-subnet.id
  route_table_id = aws_route_table.harshvardhan-private-rt.id
}
resource "aws_route_table_association" "subnet-assoc-private-2" {
  subnet_id      = aws_subnet.harshvardhan-private-subnet-2.id
  route_table_id = aws_route_table.harshvardhan-private-rt.id
}

resource "aws_route_table_association" "subnet-assoc-public" {
  subnet_id      = aws_subnet.harshvardhan-public-subnet.id
  route_table_id = aws_route_table.harshvardhan-public-rt.id
}
resource "aws_route_table_association" "subnet-assoc-public-2" {
  subnet_id      = aws_subnet.harshvardhan-public-subnet-2.id
  route_table_id = aws_route_table.harshvardhan-public-rt.id
}