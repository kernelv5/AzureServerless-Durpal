# Resources Gropu Configuration
# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.28.0"
}
resource "azurerm_resource_group" "appRG" {
  name     = "${var.RGName}"
  location = "${var.RGLocation}"
}
resource "azurerm_mysql_server" "appMySQL" {
  name                = "${var.DBSName}"
  location            = "${azurerm_resource_group.appRG.location}"
  resource_group_name = "${azurerm_resource_group.appRG.name}"

  sku {
    name     = "${var.DBSKU_name}"
    capacity = "${var.DBSKU_Capacity}"
    tier     = "${var.DBSKU_Tier}"
    family   = "${var.DBSKU_Family}"
  }

  storage_profile {
    storage_mb            = "${var.sp_storage}"
    backup_retention_days = "${var.sp_backReten}"
    geo_redundant_backup  = "${var.sp_geoRedunt}"
  }

  administrator_login          = "${var.admin_user}"
  administrator_login_password = "${var.admin_login}"
  version                      = "${var.dbversion}"
  ssl_enforcement              = "${var.dbSSLenf}"
}

#resource "azurerm_mysql_database" "InitDatabase" {
#  name                = "${var.DBName}}"
#  resource_group_name = "${azurerm_resource_group.appRG.name}"
#  server_name         = "${azurerm_mysql_server.appMySQL.name}"
#  charset             = "utf8"
#  collation           = "utf8_general_ci"
#}