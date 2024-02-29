# resource "aws_lb" "harshvardhan-alb-service" {
#   name               = "harshvardhan-alb-service"
#   internal           = false
#   load_balancer_type = "application"
#   subnets            = [aws_subnet.harshvardhan-public-subnets[0].id ,aws_subnet.harshvardhan-public-subnets[1].id]
#   security_groups    = [module.harshvardhan-alb-sg.sg_id] 
# }

# resource "aws_lb_listener" "alb-listener" {
#   load_balancer_arn = aws_lb.harshvardhan-alb-service.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.harshvardhan-tg.arn
#   }

# }

module "harshvardhan-alb" {
  source = "./modules/load-balancer"
  name = "harshvardhan-alb-service"
  internal= false
  lb_type = "application"
  subnets = [aws_subnet.harshvardhan-public-subnets[0].id ,aws_subnet.harshvardhan-public-subnets[1].id]
  security_groups    = [module.harshvardhan-alb-sg.sg_id] 

  balancer_port = "80"
  protocol = "HTTP"
  tg_arn = module.harshvardhan-tg.tg_arn
}