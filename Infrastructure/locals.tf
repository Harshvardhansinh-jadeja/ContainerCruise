locals {
   bastion_private_ip = "${aws_instance.harshvardhan-bastion.private_ip}/32"
}