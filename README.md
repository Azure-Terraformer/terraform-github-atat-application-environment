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
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of the application being deployed. <br>This is used for tagging resources and organizing outputs for clarity. <br>Ensure the name is concise and unique to your application to avoid conflicts. | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | An object containing details of the GitHub user used for committing changes <br>within the workflows:<br>- name: The display name of the user for commits.<br>- email: The email address associated with the commit user. <br>  Ensure this matches an authorized user in your GitHub account. | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_environments"></a> [environments](#input\_environments) | A map defining the deployment environments and their associated configuration details. <br>Each key in the map represents an environment (e.g., "dev", "prod"), and the value <br>specifies the corresponding configuration:<br>- subscription\_id: The Azure subscription ID for the environment.<br>- tenant\_id: The Azure tenant ID for authentication.<br>- client\_id: The client ID of the Azure Service Principal used for deployments.<br>- branch\_name: The Git branch associated with this environment, where Terraform <br>  changes will be deployed from.<br>- reviewers: A list of GitHub usernames or teams that must review and approve <br>  pull requests for changes to this environment.<br>- backend: The storage backend configuration for managing Terraform state and <br>  plan files:<br>  - resource\_group\_name: The name of the Azure resource group hosting the <br>    storage backend.<br>  - storage\_account\_name: The name of the Azure Storage Account used for <br>    storing Terraform state files.<br>  - state\_container\_name: The container name within the storage account for <br>    storing the state file.<br>  - plan\_container\_name: The container name within the storage account for <br>    storing the Terraform plan files. | <pre>map(object({<br>    subscription_id = string<br>    tenant_id       = string<br>    client_id       = string<br>    branch_name     = string<br>    reviewers       = list(string)<br>    backend = object({<br>      resource_group_name  = string<br>      storage_account_name = string<br>      state_container_name = string<br>      plan_container_name  = string<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the GitHub repository where the Terraform configurations and <br>workflows will be hosted. The repository must exist prior to running the module. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform to be used in the automation workflows. <br>Defaults to "1.9.8". Ensure this version is compatible with your modules <br>and the Azure provider configurations. | `string` | `"1.9.8"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->