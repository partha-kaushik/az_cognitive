# Create a subnet within a vnet
resource "azurerm_subnet" "basic-subnet" {
   name                 = "challenge-subnet"
   resource_group_name  =  var.resource_group_name
   virtual_network_name = var.virtual_network_name
   address_prefixes     = var.address_prefixes
} 