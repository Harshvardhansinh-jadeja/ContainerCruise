module "harshvardhan-alb-sg" {
  source = "./modules/security-group"
  name = "harshvardhan-alb-sg"
  desc = "Application Load balancer"
  vpc = module.harshvardhan-vpc.vpc_id
   ingress_rules = [{
    from_port   = 3000
    to_port     = 3000
    description = "Port 443"
    cidr_blocks= [var.anywhere]
    security_groups= null
  },
  {
    from_port   = 80
    to_port     = 80
    description = "Port 80"
    cidr_blocks= [var.anywhere]
    security_groups= null
  }
  ]
  egress_rules = [{
        cidr_blocks = [var.anywhere]
        security_groups = null
        protocol = "-1"
        from_port   = 0
        to_port     = 0
  }]
}


module "harshvardhan-ecs-sg" {
  source = "./modules/security-group"
  name = "harshvardhan-ecs-sg"
  desc = "Elastic Container service group"
  vpc = module.harshvardhan-vpc.vpc_id
   ingress_rules = [{
    from_port   = 3000
    to_port     = 3000
    description = "Port 443"
    cidr_blocks= null
    security_groups= [module.harshvardhan-alb-sg.sg_id]
  },
  {
    from_port   = 80
    to_port     = 80
    description = "Port 80"
    cidr_blocks= null
    security_groups= [module.harshvardhan-alb-sg.sg_id]
  }
  ]
  egress_rules = [{
        cidr_blocks = [var.anywhere]
        security_groups = null
        protocol = "-1"
        from_port   = 0
        to_port     = 0
  }]
}


module "harshvardhan-RDS-sg" {
  source = "./modules/security-group"
  name = "harshvardhan-RDS-sg"
  desc = "Relational Database System"
  vpc = module.harshvardhan-vpc.vpc_id
   ingress_rules = [{
    from_port   =  var.db_port
    to_port     =  var.db_port
    description = "ECS for RDS"
    cidr_blocks= null
    security_groups= [module.harshvardhan-ecs-sg.sg_id]
  },
  {
    from_port   =  var.db_port
    to_port     =  var.db_port
    description = "Bastion for RDS"
    cidr_blocks= [local.bastion_private_ip]
    security_groups= null
    }
  ]
  egress_rules = [{
        cidr_blocks = [var.anywhere]
        security_groups = null
        protocol = "-1"
        from_port   = 0
        to_port     = 0
  }]
}

module "harshvardhan-bastion-sg" {
  source = "./modules/security-group"
  name = "harshvardhan-bastion-sg"
  desc = "Bastion Host for SSH access"
  vpc = module.harshvardhan-vpc.vpc_id
   ingress_rules = [{
    from_port   =  22
    to_port     =  22
    description = "Bastion for RDS"
    cidr_blocks= [var.anywhere]
    security_groups= null
  }
  ]
  egress_rules = [{
        cidr_blocks = [var.anywhere]
        security_groups = null
        protocol = "-1"
        from_port   = 0
        to_port     = 0
  }]
}
