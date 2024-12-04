module "terraform_simple_codebase" {

  source  = "Azure-Terraformer/codebase-terraform-azure-application/github"
  version = "1.0.1"

  repository  = var.repository_name
  branch      = github_branch.main.branch
  commit_user = var.commit_user

}
