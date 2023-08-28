# Create Primary mssql firewall rule
module "primary_mssql_firewall_rule" {
  source           = "github.com/ARCH-AMIS/tf_mod_az_mssql//mssql_firewall_rule?ref=v2.1.2"
  for_each         = local.mssql_firewall_rules
  name             = each.key
  server_id        = module.primary_mssql_server.mssql_server.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address

  depends_on = [
    module.primary_mssql_server
  ]
}