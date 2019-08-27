# Resources Gropu Configuration
# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.28.0"
}
resource "azurerm_resource_group" "appRG" {
  name     = "TestingTerraform"
  location = "East Asia"
}

resource "azurerm_app_service_plan" "appSP" {
  name                = "PADSHOWCASEs"
  location            = "${azurerm_resource_group.appRG.location}"
  resource_group_name = "${azurerm_resource_group.appRG.name}"
  kind                = "Linux"
  reserved            = "true"

  sku {
    tier = "Premium V2"
    size = "S1"
  }
}

resource "azurerm_app_service" "appS" {
  name                = "TestAPP123432"
  location            = "${azurerm_resource_group.appRG.location}"
  resource_group_name = "${azurerm_resource_group.appRG.name}"
  app_service_plan_id = "${azurerm_app_service_plan.appSP.id}"

  site_config {
    linux_fx_version = "DOCKER|nginxdemos/hello:latest"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
  }
}