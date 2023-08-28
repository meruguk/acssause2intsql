# Create Primary mssql server 
module "primary_mssql_server" {
  source                        = "github.com/ARCH-AMIS/tf_mod_az_mssql//mssql_server?ref=v2.1.2"
  name                          = "acssause2intsql"
  resource_group_name           = data.azurerm_resource_group.resource_group.name
  location                      = local.primary_region
  administrator_login           = "sqladmin"
  key_vault_id                  = data.azurerm_key_vault.key_vault.id
  minimum_tls_version           = 1.2
  sql_version                   = "12.0"
  public_network_access_enabled = "true"
  azuread_administrator = {
    login_username = data.azuread_group.group.display_name
    object_id      = data.azuread_group.group.object_id
  }
  identity = {
    type = "SystemAssigned"
  }

  tags = merge(local.common_tags, {
    Application = "Azure SQL Server"
  })
}

