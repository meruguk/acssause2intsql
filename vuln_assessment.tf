# Create vulnerability assessment for primary mssql server 
module "primary_vulnerability_assessment" {
  source                          = "github.com/ARCH-AMIS/tf_mod_az_mssql//mssql_server_vulnerability_assessment?ref=v2.1.2"
  server_security_alert_policy_id = module.primary_security_alert_policy.mssql_server_security_alert_policy.id
  storage_container_path          = "${module.primary_assessment_container.storage_container.id}/"
  storage_account_access_key      = data.azurerm_storage_account.storage_account.primary_access_key

  recurring_scans = {
    enabled = true
    emails  = local.email_addresses
  }

  depends_on = [
    module.primary_security_alert_policy,
    module.primary_assessment_container
  ]
}