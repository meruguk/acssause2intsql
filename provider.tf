# SHARED-NP-SUB subscription
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  subscription_id = "7968d9b5-62c7-461c-a713-136f87afccad"
}


# Set azurerm provider for getting private dns zone
provider "azurerm" {
  features {}

  subscription_id = "aa84623b-d55c-410a-ba80-a876ed7bc6ef"
  alias           = "ACS-USE2-PROD-ATS-IAAS"
}
