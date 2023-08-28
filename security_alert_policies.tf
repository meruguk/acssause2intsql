# Create security alert policy for primary mssql server 
module "primary_security_alert_policy" {
  source                     = "github.com/ARCH-AMIS/tf_mod_az_mssql//mssql_server_security_alert_policy?ref=v2.1.2"
  resource_group_name        = data.azurerm_resource_group.resource_group.name
  server_name                = module.primary_mssql_server.mssql_server.name
  storage_endpoint           = data.azurerm_storage_account.storage_account.primary_blob_endpoint
  storage_account_access_key = data.azurerm_storage_account.storage_account.primary_access_key
  email_addresses            = local.email_addresses

  depends_on = [
    module.primary_mssql_server
  ]
}