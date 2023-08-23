variable "name"     { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "kind" { type = string }
variable "sku_name" { type = string }
variable "outbound_network_access_restricted" { type = bool }
variable "public_network_access_enabled" { type = bool }
variable "tags" {
    description = "Tags to set"
    type        = map(string)
}
variable subnet_id { type = string }
variable custom_subdomain_name { type = string }