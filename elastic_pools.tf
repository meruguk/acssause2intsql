#  Create primary mssql elasticpool
module "primary_pool" {
  source              = "github.com/ARCH-AMIS/tf_mod_az_mssql//mssql_elasticpool?ref=v2.1.2"
  name                = "ACS-SA-USE2-INT-SQL-EP01"
  resource_group_name = data.azurerm_resource_group.resource_group.name
  location            = local.primary_region
  server_name         = module.primary_mssql_server.mssql_server.name
  max_size_gb         = 100

  sku = {
    name     = "GP_Gen5"
    capacity = 4
    tier     = "GeneralPurpose"
    family   = "Gen5"
  }

  per_database_settings = {
    min_capacity = 1
    max_capacity = 2
  }

  tags = merge(local.common_tags, {
    Application = "Azure SQL Elastic Pool"
  })

  depends_on = [
    module.primary_mssql_server
  ]
}