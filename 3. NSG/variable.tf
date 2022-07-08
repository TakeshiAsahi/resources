variable "resource_group_name" {
  default = "Dey-NSG-rg"
}

variable "resource_group_location" {
  default = "West Europe"
}

variable "resource_nsg_name" {
  default = "Dey-NSG"
}


variable "name" {
  default = "test123"
}
variable "priority" {
  default = 100
}
variable "direction" {
  default = "Inbound"
}
variable "access" {
  default = "Allow"
}
variable "protocol" {
  default = "Tcp"
}
variable "source-port-range" {
  default = "*"
}
variable "destination_port_range" {
  default = "*"
}
variable "source_address_prefix" {
  default = "*"
}
variable "destination_address_prefix" {
  default = "*"
}
