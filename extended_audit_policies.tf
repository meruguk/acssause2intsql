# Create primary mssql server extended auditing policy 
module "primary_extended_audit_policy" {
  source                     = "github.com/ARCH-AMIS/tf_mod_az_mssql//mssql_server_extended_auditing_policy?ref=v2.1.2"
  server_id                  = module.primary_mssql_server.mssql_server.id
  storage_endpoint           = data.azurerm_storage_account.storage_account.primary_blob_endpoint
  storage_account_access_key = data.azurerm_storage_account.storage_account.primary_access_key

  depends_on = [
    module.primary_mssql_server
  ]
}