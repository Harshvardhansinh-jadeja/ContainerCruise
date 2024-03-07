output "alb_DNS" {
  value = module.harshvardhan-alb.dns
}

output "bastion_public_IP" {
    value = module.bastion_host.public_ip
}

output "endpoint" {
  value = module.harshvardhan-rds.endpoint
}
