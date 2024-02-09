resource "aws_security_group" "harshvardhan-alb-sg" {
  name        = "harshvardhan-alb-sg"
  description = "allow traffic"
  vpc_id      = aws_vpc.harshvardhan-vpc.id

  tags = {
    Name = "harshvardhan-alb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress-3000-alb" {
  security_group_id = aws_security_group.harshvardhan-alb-sg.id
  cidr_ipv4         = var.anywhere
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
}
resource "aws_vpc_security_group_ingress_rule" "ingress-80-alb" {
  security_group_id = aws_security_group.harshvardhan-alb-sg.id
  cidr_ipv4         = var.anywhere
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4-alb" {
  security_group_id = aws_security_group.harshvardhan-alb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "harshvardhan-ecs-sg" {
  name        = "harshvardhan-ecs-sg"
  description = "allow traffic from alb"
  vpc_id      = aws_vpc.harshvardhan-vpc.id
  tags = {
    Name = "harshvardhan-ecs-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress-ipv4-80-ecs" {
  security_group_id = aws_security_group.harshvardhan-ecs-sg.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  referenced_security_group_id = aws_security_group.harshvardhan-alb-sg.id

}
resource "aws_vpc_security_group_ingress_rule" "ingress-ipv4-3000-ecs" {
  security_group_id = aws_security_group.harshvardhan-ecs-sg.id
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
  referenced_security_group_id = aws_security_group.harshvardhan-alb-sg.id

}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4-ecs" {
  security_group_id = aws_security_group.harshvardhan-ecs-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



