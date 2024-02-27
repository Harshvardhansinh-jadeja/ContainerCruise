resource "aws_lb" "harshvardhan-alb-service" {
  name               = "harshvardhan-alb-service"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.harshvardhan-public-subnets[0].id ,aws_subnet.harshvardhan-public-subnets[1].id]
  security_groups    = [aws_security_group.harshvardhan-alb-sg.id] 
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.harshvardhan-alb-service.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.harshvardhan-tg.arn
  }

}