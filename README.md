# terraform-github-atat-application-environment

Let's go!!!
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_action-azure-login-test"></a> [action-azure-login-test](#module\_action-azure-login-test) | Azure-Terraformer/action-azure-login-test/github | 1.0.0 |
| <a name="module_azure-credential"></a> [azure-credential](#module\_azure-credential) | Azure-Terraformer/azure-credential/github | 1.0.0 |
| <a name="module_azure_backend"></a> [azure\_backend](#module\_azure\_backend) | Azure-Terraformer/azure-backend/github | 1.0.1 |
| <a name="module_terraform_manual"></a> [terraform\_manual](#module\_terraform\_manual) | Azure-Terraformer/action-azure-application/github | 1.0.23 |
| <a name="module_terraform_simple_codebase"></a> [terraform\_simple\_codebase](#module\_terraform\_simple\_codebase) | Azure-Terraformer/codebase-terraform-azure-application/github | 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [github_actions_environment_variable.environment_name](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |
| [github_actions_environment_variable.terraform_version](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |
| [github_actions_environment_variable.terraform_working_directory](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |
| [github_actions_variable.application_name](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_branch.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_repository_environment.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | n/a | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | n/a | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_environments"></a> [environments](#input\_environments) | n/a | <pre>map(object({<br>    subscription_id = string<br>    tenant_id       = string<br>    client_id       = string<br>    branch_name     = string<br>    reviewers       = list(string)<br>    backend = object({<br>      resource_group_name  = string<br>      storage_account_name = string<br>      state_container_name = string<br>      plan_container_name  = string<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | n/a | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | n/a | `string` | `"1.9.8"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->