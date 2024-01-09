# Module - User Assigned Identity
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the creation of User Assigned Identity

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.6.6            | 3.86.0          |

## Specifying a version

To avoid that your code get the latest module version, you can define the `?ref=***` in the URL to point to a specific version.
Note: The `?ref=***` refers a tag on the git module repo.

## Use case
```hcl
module "mi-<system>-<env>-<used for>" {
  source              = "git::https://github.com/danilomnds/terraform-azurerm-user-assigned-identity?ref=v1.0.0"
  name                = "mi-<system>-<env>-<used for>"
  location            = <location>
  resource_group_name = <resource group name>
  tags = {
    key1 = value1
    key2 = value2
  }
  azure_ad_groups = ["group 1 that will have reader access on the managed identity", "group 2"]
}
output "id" {
  value = module.mi-<system>-<env>-<used for>.id
}
output "client_id" {
  value = module.mi-<system>-<env>-<used for>.client_id
}
output "principal_id" {
  value = module.mi-<system>-<env>-<used for>.principal_id
}
output "tenant_id" {
  value = module.mi-<system>-<env>-<used for>.tenant_id
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | managed identity name | `string` | n/a | `Yes` |
| location | azure region | `string` | n/a | `Yes` |
| resource_group_name | the name of the resource group in which the app service plan exists | `string` | n/a | `Yes` |
| tags | tags for the resource | `map(string)` | `{}` | No |
| azure_ad_groups | list of azure AD groups that will have reader access  | `list` | `[]` | No |

  ## Output variables

| Name | Description |
|------|-------------|
| id | resource id |
| client_id | client_id of MI |
| principal_id | principal_id of MI |
| tenant_id | tenant_id of MI belongs to |

## Documentation
User Assigned Identity: <br>
[https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity)