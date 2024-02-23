# APPLICATION LOAD BALANCER
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

# ELASTIC CONTAINER SERVICE
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

# AMAZON RDS 
resource "aws_security_group" "harshvardhan-rds-sg" {
  name        = "harshvardhan-rds-sg"
  description = "allow traffic for RDS"
  vpc_id      = aws_vpc.harshvardhan-vpc.id
  tags = {
    Name = "harshvardhan-RDS-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress-rds-ecs" {
  security_group_id = aws_security_group.harshvardhan-rds-sg.id
  from_port         = var.db_port
  ip_protocol       = "tcp"
  to_port           = var.db_port
  referenced_security_group_id = aws_security_group.harshvardhan-ecs-sg.id
}
resource "aws_vpc_security_group_ingress_rule" "ingress-rds-EC2_instance" {
  security_group_id = aws_security_group.harshvardhan-rds-sg.id
  from_port         = var.db_port
  ip_protocol       = "tcp"
  to_port           = var.db_port
  cidr_ipv4 =  local.bastion_private_ip
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4-rds" {
  security_group_id = aws_security_group.harshvardhan-rds-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# BASTION HOST
resource "aws_security_group" "harshvardhan-bastion-sg" {
  name        = "harshvardhan-bastion-sg"
  description = "allow traffic"
  vpc_id      = aws_vpc.harshvardhan-vpc.id

  tags = {
    Name = "harshvardhan-bastion-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.harshvardhan-bastion-sg.id
  cidr_ipv4         = var.anywhere
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4-bastion" {
  security_group_id = aws_security_group.harshvardhan-bastion-sg.id
  cidr_ipv4         =var.anywhere
  ip_protocol       = "-1" # semantically equivalent to all ports
}
