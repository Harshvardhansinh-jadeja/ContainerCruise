resource "aws_db_instance" "harshvardhan-rds" {
    identifier = "harshvardhan-rds"
    instance_class = "db.t3.micro"
    storage_type = "gp2"
    engine = "postgres"
    apply_immediately = true
    publicly_accessible = false
    username = var.username
    password = var.password
    db_name = "auth"
    allocated_storage = 10
    db_subnet_group_name = aws_db_subnet_group.harshvardhan-sub-group.name
    tags = {
        "name" = "harshvardhan-rds" 
    }
    vpc_security_group_ids = [aws_security_group.harshvardhan-rds-sg.id]
}