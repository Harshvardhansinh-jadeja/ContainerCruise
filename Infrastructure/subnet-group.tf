resource "aws_db_subnet_group" "harshvardhan-sub-group" {
  name       = "harshvardhan-sub-group"
  subnet_ids = [aws_subnet.harshvardhan-private-subnets[0].id, aws_subnet.harshvardhan-private-subnets[1].id]

  tags = {
    Name = "harshvardhan-subnet-group"
  }
}