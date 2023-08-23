variable "tenant_id" { type = string }
variable "subscription_id" { type = string }
variable "cognitive_account_name_prefix"  { type = string }
variable "location_r1" { type = string }

variable "kind" { type = string }
variable "sku_name" { type = string }
variable "outbound_network_access_restricted" { type = bool }
variable "public_network_access_enabled" { type = bool }

variable "resource_tags" {
    description = "Tags to set for resources"
    type        = map(string)
}

variable "custom_subdomain_name" { type = string }