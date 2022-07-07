#provider file
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

#resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

#cosmodb account
resource "azurerm_cosmosdb_account" "acc" {
  name                      = var.cosmos_db_account_name
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  enable_automatic_failover = true
  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }
  geo_location {
    location          = var.resource_group_location
    failover_priority = 0
  }
}

#sql db core - database
resource "azurerm_cosmosdb_sql_database" "db" {
  name                = var.database_name
  resource_group_name = azurerm_cosmosdb_account.acc.resource_group_name
  account_name        = azurerm_cosmosdb_account.acc.name
}

#sql db's collevtion
resource "azurerm_cosmosdb_sql_container" "coll" {
  name                = var.container_name
  resource_group_name = azurerm_cosmosdb_account.acc.resource_group_name
  account_name        = azurerm_cosmosdb_account.acc.name
  database_name       = azurerm_cosmosdb_sql_database.db.name
  partition_key_path  = var.partition_key_path_name
}































# # We strongly recommend using the required_providers block to set the
# # Azure Provider source and version being used
# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=3.0.0"
#     }
#   }
# }

# # Configure the Microsoft Azure Provider
# provider "azurerm" {
#   features {}
# }

# #create rg
# resource "azurerm_resource_group" "rg" {
#   name     = "TestCli"
#   location = "East US"
# }

# #cosmosdb account
# resource "azurerm_cosmosdb_account" "db" {
#   name                = "cosmodey"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }


# #cosmodb account
# data "azurerm_cosmosdb_account" "example" {
#   name                = "dey-cosmosdb-account"
#   resource_group_name = azurerm_resource_group.rg.name
# }

# #sql database in azure cosmos db
# resource "azurerm_cosmosdb_sql_database" "example" {
#   name                = "tfex-cosmos-mongo-db"
#   resource_group_name = data.azurerm_cosmosdb_account.example.resource_group_name
#   account_name        = data.azurerm_cosmosdb_account.example.name
#   throughput          = 400
# }




