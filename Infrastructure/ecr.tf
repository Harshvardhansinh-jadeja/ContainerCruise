resource "aws_ecr_repository" "harshvardhan-repo" {
  name = "harshvardhan-repo" 
}

resource "null_resource" "run_comand_one" {
  depends_on = [ aws_ecr_repository.harshvardhan-repo ]
  provisioner "local-exec" {
    command = <<-EOT
       aws ecr get-login-password --region ${var.region} --profile ${var.profile} | docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com
  EOT
  }
}

resource "null_resource" "run_comand_two" {
  depends_on = [null_resource.run_comand_one]
  
  provisioner "local-exec" {
    command = <<-EOT
      docker build -t ${var.local-image} ../code
  EOT
  }
}
resource "null_resource" "run_comand_three" {
  depends_on = [ null_resource.run_comand_two]
  
  provisioner "local-exec" {
    command = <<-EOT
       docker tag ${var.local-image}:latest ${aws_ecr_repository.harshvardhan-repo.repository_url}
  EOT
  }
}
resource "null_resource" "run_comand_four" {
  depends_on = [ null_resource.run_comand_three ]

  provisioner "local-exec" {
    command = <<-EOT
      docker push ${aws_ecr_repository.harshvardhan-repo.repository_url}
       EOT
  }
}
