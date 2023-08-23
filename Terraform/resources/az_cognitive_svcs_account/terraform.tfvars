# Subscription: Azure Subscription 1
tenant_id = "d908a083-5765-4465-91ba-9f88a400040c"
subscription_id = "0403b4d3-ef28-4259-a40d-c7250fd67ec6"
cognitive_account_name_prefix = "challenge-resources"
location_r1 = "West Europe"

kind = "TextAnalytics"
sku_name = "S0" 
outbound_network_access_restricted = true
public_network_access_enabled = false

resource_tags = {
  project     = "partha-challenge",
  environment = "dev"
}

custom_subdomain_name = "basf-cognitive-dev01"