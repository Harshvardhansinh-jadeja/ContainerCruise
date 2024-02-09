resource "aws_ecs_cluster" "harshvardhan-cluster" {
  name = "harshvardhan-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "FARGATE" {
  cluster_name = aws_ecs_cluster.harshvardhan-cluster.name
  capacity_providers = ["FARGATE"]
}

resource "aws_ecs_task_definition" "harshvardhan-task-def" {
  family = "harshvardhan-task-def"
  network_mode = "awsvpc"
  container_definitions = jsonencode([
    {
      name      =  var.container-name,
      image     = "${aws_ecr_repository.harshvardhan-repo.repository_url}"
    #    cpu = "0.5 vCPU"
    #    memory = 1024
      essential = true
      portMappings = [
        {
          containerPort = var.container-port
          hostPort      = var.container-port
        }
      ]
    }
  ])
  
  requires_compatibilities = [ "FARGATE" ]
  cpu = "0.5 vCPU"
  memory = "1GB"
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture = "X86_64"
  }
  execution_role_arn = data.aws_iam_role.task_exec-role.arn
}

resource "aws_ecs_service" "harshvardhan-service" {
  name            = "harshvardhan-service"
  cluster         = aws_ecs_cluster.harshvardhan-cluster.id
  task_definition = aws_ecs_task_definition.harshvardhan-task-def.arn
  desired_count   = 1
  launch_type = "FARGATE"
  scheduling_strategy = "REPLICA"
  


  load_balancer {
    target_group_arn = aws_lb_target_group.harshvardhan-tg.arn
    container_name   = var.container-name
    container_port   = 80
  }

  network_configuration {
    subnets = [aws_subnet.harshvardhan-private-subnet.id,aws_subnet.harshvardhan-private-subnet-2.id]
    security_groups = [aws_security_group.harshvardhan-ecs-sg.id]
  }

}