resource "aws_lb_target_group" "harshvardhan-tg" {
  name     = "harshvardhan-tg"
  port     = var.container-port
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.harshvardhan-vpc.id
}

# resource "aws_lb_target_group_attachment" "harshvardhan-tg-attachment" {
#   target_group_arn = aws_lb_target_group.harshvardhan-tg.arn
#   target_id        = aws_ecs_service.harshvardhan-service.id
#   port             = var.container-port
# } 