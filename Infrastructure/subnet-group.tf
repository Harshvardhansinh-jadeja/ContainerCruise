resource "aws_db_subnet_group" "harshvardhan-sub-group" {
  name       = "harshvardhan-sub-group"
  subnet_ids = [aws_subnet.harshvardhan-private-subnet.id, aws_subnet.harshvardhan-private-subnet-2.id]

  tags = {
    Name = "harshvardhan-subnet-group"
  }
}