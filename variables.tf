variable "application_name" {

  type        = string
  description = <<DESCRIPTION
The name of the application being deployed. 
This is used for tagging resources and organizing outputs for clarity. 
Ensure the name is concise and unique to your application to avoid conflicts.
DESCRIPTION

}

variable "repository_name" {

  type        = string
  description = <<DESCRIPTION
The name of the GitHub repository where the Terraform configurations and 
workflows will be hosted. The repository must exist prior to running the module.
DESCRIPTION

}

variable "commit_user" {

  type = object({
    name  = string
    email = string
  })

  description = <<DESCRIPTION
An object containing details of the GitHub user used for committing changes 
within the workflows:
- name: The display name of the user for commits.
- email: The email address associated with the commit user. 
  Ensure this matches an authorized user in your GitHub account.
DESCRIPTION

}

variable "environments" {

  type = map(object({
    subscription_id = string
    tenant_id       = string
    client_id       = string
    branch_name     = string
    reviewers       = list(string)
    backend = object({
      resource_group_name  = string
      storage_account_name = string
      state_container_name = string
      plan_container_name  = string
    })
  }))

  description = <<DESCRIPTION
A map defining the deployment environments and their associated configuration details. 
Each key in the map represents an environment (e.g., "dev", "prod"), and the value 
specifies the corresponding configuration:
- subscription_id: The Azure subscription ID for the environment.
- tenant_id: The Azure tenant ID for authentication.
- client_id: The client ID of the Azure Service Principal used for deployments.
- branch_name: The Git branch associated with this environment, where Terraform 
  changes will be deployed from.
- reviewers: A list of GitHub usernames or teams that must review and approve 
  pull requests for changes to this environment.
- backend: The storage backend configuration for managing Terraform state and 
  plan files:
  - resource_group_name: The name of the Azure resource group hosting the 
    storage backend.
  - storage_account_name: The name of the Azure Storage Account used for 
    storing Terraform state files.
  - state_container_name: The container name within the storage account for 
    storing the state file.
  - plan_container_name: The container name within the storage account for 
    storing the Terraform plan files.
DESCRIPTION

}

variable "terraform_version" {

  type        = string
  default     = "1.9.8"
  description = <<DESCRIPTION
The version of Terraform to be used in the automation workflows. 
Defaults to "1.9.8". Ensure this version is compatible with your modules 
and the Azure provider configurations.
DESCRIPTION

}
