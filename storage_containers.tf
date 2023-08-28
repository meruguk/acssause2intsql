# Create the storage account container used for vulnerability assessments 
module "primary_assessment_container" {
  source               = "github.com/ARCH-AMIS/tf_mod_az_storage_account//storage_container?ref=v2.2.1"
  name                 = module.primary_mssql_server.mssql_server.name
  storage_account_name = data.azurerm_storage_account.storage_account.name
}