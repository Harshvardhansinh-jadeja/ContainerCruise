resource "aws_route_table" "harshvardhan-public-rt" {
  vpc_id = module.harshvardhan-vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.harshvardhan-igw.igw_id
  }
  tags = {
    Name = "${var.environment}-public-rt"
  }
  
}

resource "aws_route_table" "harshvardhan-private-rt" {
  vpc_id =module.harshvardhan-vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = module.harshvardhan-ngw.nat_id
  }
  tags = {
    Name = "${var.environment}-private-rt"
  }
}



resource "aws_route_table_association" "subnet-assoc-private" {
  subnet_id      = aws_subnet.harshvardhan-private-subnets[0].id
  route_table_id = aws_route_table.harshvardhan-private-rt.id
}
resource "aws_route_table_association" "subnet-assoc-private-2" {
  subnet_id      = aws_subnet.harshvardhan-private-subnets[1].id
  route_table_id = aws_route_table.harshvardhan-private-rt.id
}

resource "aws_route_table_association" "subnet-assoc-public" {
  subnet_id      = aws_subnet.harshvardhan-public-subnets[0].id
  route_table_id = aws_route_table.harshvardhan-public-rt.id
}
resource "aws_route_table_association" "subnet-assoc-public-2" {
  subnet_id      = aws_subnet.harshvardhan-public-subnets[1].id
  route_table_id = aws_route_table.harshvardhan-public-rt.id
}