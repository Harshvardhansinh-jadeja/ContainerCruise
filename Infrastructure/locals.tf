locals {
   bastion_private_ip = "${module.bastion_host.private_ip}/32"
}