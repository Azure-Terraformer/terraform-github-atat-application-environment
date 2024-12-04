<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.10.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 3.0.2 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.10.0 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_atat"></a> [atat](#module\_atat) | ../../ | n/a |
| <a name="module_backend_dev"></a> [backend\_dev](#module\_backend\_dev) | Azure-Terraformer/terraform-backend/azurerm | 1.0.2 |
| <a name="module_backend_prod"></a> [backend\_prod](#module\_backend\_prod) | Azure-Terraformer/terraform-backend/azurerm | 1.0.2 |
| <a name="module_github_identity"></a> [github\_identity](#module\_github\_identity) | Azure-Terraformer/github-credential/azuread | 1.0.8 |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [github_user.current](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | n/a | `any` | n/a | yes |
| <a name="input_environments"></a> [environments](#input\_environments) | n/a | <pre>map(object({<br>    subscription_id = string<br>    branch_name     = string<br>  }))</pre> | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | n/a | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->