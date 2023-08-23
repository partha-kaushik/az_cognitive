output "name" {
  value = azurerm_resource_group.resource_group.name
}
output "location" {
  value = azurerm_resource_group.resource_group.location
}

output "created_rg_id" {
    value = azurerm_resource_group.resource_group.id
    description = "resource group.id"
}
