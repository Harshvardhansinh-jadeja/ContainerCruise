resource "aws_ecr_repository" "harshvardhan-repo" {
  name = "harshvardhan-repo" 
}

output "repo_name" {
  value = aws_ecr_repository.harshvardhan-repo.repository_url
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
  depends_on = [ aws_ecr_repository.harshvardhan-repo ]
  
  provisioner "local-exec" {
    command = <<-EOT
       docker tag ${var.local-image}:latest ${aws_ecr_repository.harshvardhan-repo.repository_url}
  EOT
  }
}
resource "null_resource" "run_comand_three" {
  depends_on = [ aws_ecr_repository.harshvardhan-repo ]

  provisioner "local-exec" {
    command = <<-EOT
      docker push ${aws_ecr_repository.harshvardhan-repo.repository_url}
       EOT
  }
}
