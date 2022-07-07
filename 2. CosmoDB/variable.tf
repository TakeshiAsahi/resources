variable "resource_group_name" {
  default = "DeyCosmoDB-rg"
}
variable "resource_group_location" {
  default = "East US"
}

variable "cosmos_db_account_name" {
  default = "deycosmosterraform"
}
variable "failover_location" {
  default = "West US"
}

variable "database_name" {
  default = "database_one"
}

variable "container_name" {
  default = "cont_one"
}

variable "partition_key_path_name" {
  default = "/pathName"
}

