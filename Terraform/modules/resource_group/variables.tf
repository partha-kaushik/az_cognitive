variable "resource_group_name" {
  type = string
  description = "The name of the resource group to create"
}

variable "location" {
  type = string
  description = "The location of the resource group (eg. westus2)"
}

variable "tags" {
  type = map(any)
  description = "The tags for this resource group"
}
