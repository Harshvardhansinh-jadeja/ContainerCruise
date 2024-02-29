module "harshvardhan-cluster" {
  source = "./modules/ecs"
  name = "harshvardhan-cluster"
  family = "harshvardhan-task-def"
  container-name = var.container-name
  env_name = "DATABASE_URL"
  env_value = "postgresql://${var.username}:${var.password}@${module.harshvardhan-rds.endpoint}/auth"
  container-port= var.container-port
  image = module.harshvardhan-repo.repository_url
  awslogs-group = "/ecs/harshvardhan-task-def"
  awslogs-stream-prefix ="ecs"
  awslogs-region = var.region
  role_arn = data.aws_iam_role.task_exec-role.arn
  service_name = "harshvardhan-service"
  desired_count   = 1
  tg_arn = module.harshvardhan-tg.tg_arn
   subnets = [aws_subnet.harshvardhan-private-subnets[0].id,aws_subnet.harshvardhan-private-subnets[1].id]
  security_groups = [module.harshvardhan-ecs-sg.sg_id]
}
