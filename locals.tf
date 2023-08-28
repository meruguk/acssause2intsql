locals {
  # Define Common tags used for all depoyed resources
  common_tags = {
    Entity            = "ACS-SA"
    AppDomain         = "Strategic Analytics"
    AppDomainOwner    = "Justin Doucette"
    Application       = "Shared DE DS API"
    Environment       = "Integration"
    CreatedBy         = "Kiran Merugu"
    ProductOrFunction = "Azure SQL Server"
    LocationOrRegion  = "USE2"
  }

  /* Set primary location shortname.  
               Common locations
    Location      - Shortname   - Abbreviation
    -----------------------------------------
    East US 2     - eastus2     - USE2
    Central US    - centralus   - USC
    North Europe  - northeurope - EUN
    West Europe   - westeurope  - EUW
  */
  primary_region = "eastus2"

  # Define recipient email address for alerts and assesments
  email_addresses = toset([
    "securityoperations@archcapservices.com",
    "AMIS-DomainHybridTeam_AIGI@archcapservices.com"
  ])

  # Set the mssql_firewall_rule to allow Azure Services
  mssql_firewall_rules = {
    "Allow access to Azure services" = {
      start_ip_address = "0.0.0.0"
      end_ip_address   = "0.0.0.0"
    }
  }

}