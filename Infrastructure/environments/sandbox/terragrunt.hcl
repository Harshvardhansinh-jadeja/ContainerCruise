include {
  path = find_in_parent_folders()
}

terraform{
  source = "../../modules/ecr"
}
inputs = {
  name = "harshvardhans-repos"
  force_delete = true
}