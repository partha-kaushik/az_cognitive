terraform {
  required_version = ">= 1.3.9"

  backend "local" {} #temporarily
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.1.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.26.1"
    }
  }
}

provider "azuread" {
  tenant_id = var.tenant_id
}
provider "azurerm" {
  skip_provider_registration = true
  subscription_id = var.subscription_id
  features {}
}

# resource "azurerm_resource_group" "challenge-rg" {
#    name     = "challenge-resources"
#    location = "West Europe"   
# }
# Create a Resource Group 
module "cognitive_account_rg" {
  source = "../../modules/resource_group"
  resource_group_name = "${var.cognitive_account_name_prefix}-rg-${terraform.workspace}"
  location            = var.location_r1
  tags                = var.resource_tags
}
resource "azurerm_virtual_network" "challenge-vnet" {
   name                = "challenge-vnet"
   address_space       = ["10.0.0.0/16"]
   resource_group_name = module.cognitive_account_rg.name
   location            = module.cognitive_account_rg.location
   # location            = azurerm_resource_group.challenge-rg.location
   # resource_group_name = azurerm_resource_group.challenge-rg.name 
   
}
  
# resource "azurerm_subnet" "challenge-subnet" {
#    name                 = "challenge-subnet"
#    resource_group_name  = azurerm_resource_group.challenge-rg.name
#    virtual_network_name = azurerm_virtual_network.challenge-vnet.name
#    address_prefixes     = ["10.0.1.0/24"] 
# } 
module "az_subnet"  {
   source = "../../modules/az_subnet"
   name                 = "challenge-subnet"
   resource_group_name  =  module.cognitive_account_rg.name
   virtual_network_name = azurerm_virtual_network.challenge-vnet.name
   address_prefixes     = ["10.0.1.0/24"] 
} 

module "az_cognitive_acct" {
   source = "../../modules/az_cognitive_account"

   name                = "${var.cognitive_account_name_prefix}-${terraform.workspace}"
   location            = module.cognitive_account_rg.location
   resource_group_name = module.cognitive_account_rg.name
   
   kind                = var.kind
   sku_name            = var.sku_name
   tags                = var.resource_tags

   outbound_network_access_restricted = var.outbound_network_access_restricted
   public_network_access_enabled      = var.public_network_access_enabled
   subnet_id    = module.az_subnet.subnet_id
   custom_subdomain_name = var.custom_subdomain_name
  
}