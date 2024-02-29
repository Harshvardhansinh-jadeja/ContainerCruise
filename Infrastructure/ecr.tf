module "harshvardhan-repo" {
  source = "./modules/ecr"
  name = "harshvardhan-repo"
  force_delete = true
}


resource "null_resource" "run_comand_one" {
  depends_on = [ module.harshvardhan-repo ]
  
  provisioner "local-exec" {
    command =  "bash ecr.sh  ${var.region} ${var.profile} ${var.account_id} ${var.local-image} ${module.harshvardhan-repo.repository_url}"
  }
}
