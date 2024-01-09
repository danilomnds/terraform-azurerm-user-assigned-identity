resource "azurerm_user_assigned_identity" "managed_identity" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = local.tags
  lifecycle {
    ignore_changes = [
      tags["create_date"]
    ]
  }
}

resource "azurerm_role_assignment" "managed_identity" {
  depends_on = [azurerm_user_assigned_identity.managed_identity]
  for_each = {
    for group in var.azure_ad_groups : group => group
    if var.azure_ad_groups != []
  }
  scope                = azurerm_user_assigned_identity.managed_identity.id
  role_definition_name = "Reader"
  principal_id         = each.value
}