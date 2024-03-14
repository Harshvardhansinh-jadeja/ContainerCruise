module "harshvardhan-rds" {
  source = "./modules/rds"
  name = "${var.environment}-rds"
   instance_class = "db.t3.micro"
   storage_type = "gp2"
    engine = "postgres"
    public_access = false
    username = var.username
    password = var.password
    db_name = "auth"
    storage = 10
    skip_final_snapshot = true
    apply_immediately = true
    subnet_grp_name = module.harshvardhan-sub-group.sub_group_name
    vpc_sg  = [module.harshvardhan-RDS-sg.sg_id]
}

resource "aws_db_parameter_group" "postgresql_param_group" {
  name   = "rds all audit"
  family = "postgres"

  parameter {
    name  = "pgaudit.log"
    value = "all"
    apply_method = "immediate"
  }
}