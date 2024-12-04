resource "github_repository_environment" "main" {

  for_each = var.environments

  environment = each.key
  repository  = var.repository_name

  dynamic "reviewers" {
    for_each = each.value.reviewers != null && length(each.value.reviewers) > 0 ? each.value.reviewers : []

    content {
      users = [reviewers.value]
    }
  }

  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

}

resource "github_actions_environment_variable" "terraform_version" {

  for_each = var.environments

  repository    = var.repository_name
  environment   = each.key
  variable_name = "TERRAFORM_VERSION"
  value         = var.terraform_version
}

resource "github_actions_environment_variable" "environment_name" {

  for_each = var.environments

  repository    = var.repository_name
  environment   = each.key
  variable_name = "ENVIRONMENT_NAME"
  value         = each.key

}

resource "github_actions_environment_variable" "terraform_working_directory" {

  for_each = var.environments

  repository    = var.repository_name
  environment   = each.key
  variable_name = "TERRAFORM_WORKING_DIRECTORY"
  value         = module.terraform_simple_codebase.path

}

module "azure-credential" {
  source  = "Azure-Terraformer/azure-credential/github"
  version = "1.0.0"

  for_each = var.environments

  repository      = var.repository_name
  environment     = each.key
  subscription_id = each.value.subscription_id
  tenant_id       = each.value.tenant_id
  client_id       = each.value.client_id

  client_id_label = "TERRAFORM_ARM_CLIENT_ID"

}

module "azure_backend" {

  source  = "Azure-Terraformer/azure-backend/github"
  version = "1.0.1"

  for_each = var.environments

  repository  = var.repository_name
  environment = each.key

  resource_group_name  = each.value.backend.resource_group_name
  storage_account_name = each.value.backend.storage_account_name
  state_container_name = each.value.backend.state_container_name
  plan_container_name  = each.value.backend.plan_container_name

}
