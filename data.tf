# Get Resource group that deployment will go to 
data "azurerm_resource_group" "resource_group" {
  name = "ACSSA-USE2-INT-ANALYTICS-RGRP01"
}

# Get key vault used to store SQL admin passwords
data "azurerm_key_vault" "key_vault" {
  name                = "shareduse2nptfakv01"
  resource_group_name = "SHARED-USE2-NP-TF-AUTOMATION-RGRP01"
}

# Get the azure AD group for access to databases through SSMS
data "azuread_group" "group" {
  display_name = "GLBACL-SQLDBA"
}

# Get the storage account used for auditing and alerts
# Check if a new storage account is needed
data "azurerm_storage_account" "storage_account" {
  name                = "acssause2intazfsa"
  resource_group_name = "ACSSA-USE2-INT-ANALYTICS-RGRP01"
}

# Get subnet details for primary instance private endpoint
data "azurerm_subnet" "primary_subnet" {
  name                 = "SHARED-USE2-NSNET-MGMT"
  virtual_network_name = "SHARED-USE2-NVNET-MGMT"
  resource_group_name  = "SHARED-USE2-NP-SYSTEMS-RGRP"
}


# Get private DNS zone used for the private endpoints
data "azurerm_private_dns_zone" "private_dns_zone" {
  name                = "privatelink.database.windows.net"
  resource_group_name = "ATS-USE2-SHARED01-RGRP01"
  provider            = azurerm.ACS-USE2-PROD-ATS-IAAS
}