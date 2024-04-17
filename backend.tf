terraform {
  backend "azurerm" {
    resource_group_name = "servicetestconnection"
    storage_account_name = "aksdeploy123"
    container_name = "state"
    key = "terraform.storage"
    access_key = "1Vru7KZhL3tKs7FNJ42HLQIPNZ1mI1DbhjUwAUTUHLglDPb/PsYMygbArymnyCz3e1Wu3gjnqC9M+ASt3udiSA=="
  }
}