# Resources Gropu Configuration
# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.28.0"
}
resource "azurerm_resource_group" "appRG" {
  name     = "${var.RGName}}"
  location = "${var.RGLocation}"
}

resource "azurerm_app_service_plan" "appSP" {
  name                = "${var.AppName}"
  location            = "${var.RGName}"
  resource_group_name = "${var.RGLocation}"
  kind                = "Linux"
  reserved            = "true"

  sku {
    tier = "${var.skuTier}"
    size = "${var.skuSize}"
  }
}

resource "azurerm_app_service" "appS" {
  name                = "${var.AppName}"
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