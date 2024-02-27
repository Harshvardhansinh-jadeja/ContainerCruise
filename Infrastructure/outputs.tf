output "alb_DNS" {
  value = aws_lb.harshvardhan-alb-service.dns_name
}

output "bastion_public_IP" {
    value = module.bastion_host.public_ip
}
