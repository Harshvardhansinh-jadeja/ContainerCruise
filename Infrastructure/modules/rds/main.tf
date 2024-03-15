# This is only RDS instance not cluster's
resource "aws_db_instance" "gen-rds" {
    depends_on= [aws_db_parameter_group.postgresql_param_group]
    identifier = var.name
    instance_class = var.instance_class
    storage_type = var.storage_type
    engine = var.engine
    skip_final_snapshot = var.skip_final_snapshot
    apply_immediately = var.apply_immediately
    publicly_accessible = var.public_access
    username = var.username
    password = var.password
    db_name = var.db_name
    allocated_storage = var.storage
    db_subnet_group_name = var.subnet_grp_name
    tags = {
        "Name" = var.name
    }
    vpc_security_group_ids = var.vpc_sg
}

resource "aws_db_parameter_group" "postgresql_param_group" {
  name   = "rds"
  family = "postgres16"

  parameter {
    name  = "pgaudit.log"
    value = "all"
    apply_method = "immediate"
  }
}