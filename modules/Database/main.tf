resource "azurerm_mysql_server" "appMySQL" {
  name                = "${var.DBSName}"
  location            = "${var.RGLocation}"
  resource_group_name = "${var.RGName}"

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

resource "azurerm_mysql_firewall_rule" "main" {
  
  depends_on          = [azurerm_mysql_server.appMySQL]

  name                = "AzureAllowService"
  resource_group_name = "${var.RGName}"
  server_name         = "${var.DBSName}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_mysql_database" "InitDatabase" {

  depends_on          = [azurerm_mysql_server.appMySQL]

  name                = "${var.InitDBName}"
  resource_group_name = "${var.RGName}"
  server_name         = "${var.DBSName}"
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
}
