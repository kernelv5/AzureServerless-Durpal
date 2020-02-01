resource "azurerm_app_service_plan" "appSP" {
  # AppService Plan referrence to same AppName
  name                = "${var.AppName}"
  location            = "${var.RGLocation}"
  resource_group_name = "${var.RGName}"
  kind                = "Linux"
  reserved            = "true"

  sku {
    tier = "${var.skuTier}"
    size = "${var.skuSize}"
  }
}
resource "azurerm_app_service" "appS" {
  name                = "${var.AppName}"
  location            = "${var.RGLocation}"
  resource_group_name = "${var.RGName}"
  app_service_plan_id = "${azurerm_app_service_plan.appSP.id}"
  https_only          = true

  site_config {
    linux_fx_version = "DOCKER|drupal:latest"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
  }

connection_string {
    name  = "Database"
    type  = "MySQL"
    value = "${var.DatabaseConf}"
  }

  backup {
      name = "${var.AppName}"
      enabled = "1"
      storage_account_url = "${var.backupStorage}"
      schedule {
        frequency_interval = "1"
        frequency_unit = "Day"
        }
  }
}




