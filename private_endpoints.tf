# Create Azure Private Endpoint for primary mssql SQL server
module "primary_private_endpoint" {
  source              = "github.com/ARCH-AMIS/tf_mod_az_networking//private_endpoint?ref=v2.0.23"
  name                = "${module.primary_mssql_server.mssql_server.name}-pep"
  resource_group_name = "ACSSA-USE2-INT-ANALYTICS-RGRP01"
  #data.azurerm_resource_group.resource_group.name
  location  = local.primary_region
  subnet_id = data.azurerm_subnet.primary_subnet.id

  tags = merge(local.common_tags, {
    Application = "Azure Private Endpoint"
  })

  private_dns_zone_group = {
    name                 = "sqldbprivatednszonegroup"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.private_dns_zone.id]
  }

  private_service_connection = {
    name                           = "privateserviceconnection"
    is_manual_connection           = false
    private_connection_resource_id = module.primary_mssql_server.mssql_server.id
    subresource_names              = ["sqlServer"]
  }

  depends_on = [
    module.primary_mssql_server
  ]
}