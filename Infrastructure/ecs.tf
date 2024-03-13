module "harshvardhan-cluster" {
  source = "./modules/ecs"
  name = "${var.environment}-cluster"
  family = "harshvardhan-task-def"
  container-name = var.container-name
  # environment= [{
  #     name = "DATABASE_URL",
  #     value = "postgresql://${var.username}:${var.password}@${module.harshvardhan-rds.endpoint}/auth"
  #     },
  #    {
  #     name = "AUTH_SECRET",
  #     value = "E5rLUtvhWmt00MoXqnX9kgS9Ak8gc7Z88keYaW8mhbU="
  #     },
  #  ]

  environment = {
    "DATABASE_URL" = "postgresql://${var.username}:${var.password}@${module.harshvardhan-rds.endpoint}/auth",
    "AUTH_SECRET" = "E5rLUtvhWmt00MoXqnX9kgS9Ak8gc7Z88keYaW8mhbU="
  }

  container-port= var.container-port
  image =  "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.ecr_repo}:${var.tag}"
  role_arn = data.aws_iam_role.task_exec-role.arn
  service_name = "harshvardhan-service"
  desired_count   = 1
  tg_arn = module.harshvardhan-tg.tg_arn
   subnets = [aws_subnet.harshvardhan-private-subnets[0].id,aws_subnet.harshvardhan-private-subnets[1].id]
   aws_log = {
     logDriver: "awslogs",
                options: {
                    awslogs-group: "/ecs/harshvardhan-task-def" ,
                    awslogs-region: var.region,
                    awslogs-create-group: "true" ,
                    awslogs-stream-prefix:  "ecs"
                }
   }
  security_groups = [module.harshvardhan-ecs-sg.sg_id]
}
