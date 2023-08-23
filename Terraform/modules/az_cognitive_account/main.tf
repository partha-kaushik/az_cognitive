resource "azurerm_cognitive_account" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  
  kind                = var.kind
  sku_name            = var.sku_name
  tags                = var.tags
  custom_subdomain_name = "basf-cognitive-dev01"

  outbound_network_access_restricted = var.outbound_network_access_restricted
  public_network_access_enabled      = var.public_network_access_enabled
  local_auth_enabled                 = false
  network_acls {
    default_action = "Deny"
    virtual_network_rules {
      ignore_missing_vnet_service_endpoint = false
      subnet_id = var.subnet_id
    }
  }
}