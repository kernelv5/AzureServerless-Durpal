
module "MDBCreate" {
  source = "./modules/Database"
  
  RGName          = "${var.ProInfo["RGName"]}"
  RGLocation      = "${var.ProInfo["RGZone"]}"

  DBSName         = "${var.ProInfo["DBSName"]}"
  DBSKU_name      = "${var.ProInfo["DBSKU_name"]}"
  DBSKU_Capacity  = "${var.ProInfo["DBSKU_Capacity"]}"
  DBSKU_Tier      = "${var.ProInfo["DBSKU_Tier"]}"
  DBSKU_Family    = "${var.ProInfo["DBSKU_Family"]}"
  sp_storage      = "${var.ProInfo["sp_storage"]}"
  sp_backReten    = "${var.ProInfo["sp_backReten"]}"
  sp_geoRedunt    = "${var.ProInfo["sp_geoRedunt"]}"
  admin_user      = "${var.ProInfo["admin_user"]}"
  admin_login     = "${var.ProInfo["admin_login"]}"
  dbversion       = "${var.ProInfo["dbversion"]}"
  dbSSLenf        = "${var.ProInfo["dbSSLenf"]}"
  InitDBName      = "${var.ProInfo["InitDBName"]}"
  
}
module "MAppCreate" {
    source = "./modules/AppService"
    RGName          = "${var.ProInfo["RGName"]}"
    RGLocation      = "${var.ProInfo["RGZone"]}"
    skuTier         = "${var.ProInfo["SKU_Tier"]}"
    skuSize         = "${var.ProInfo["SKU_Size"]}"
    AppName         = "${var.ProInfo["AppName"]}"
    backupStorage   = "${var.ProInfo["backupStorage"]}"
    DatabaseConf    = "Database=TestDatabase;Data Source=${module.MDBCreate.Connection_HostName};User ID=${var.ProInfo["admin_user"]}; Password=${var.ProInfo["admin_login"]}"

}

