module "RGCreate" {
  source = "./modules/ResourceGroup"
  RGName = var.RGName
  RGLocation = var.RGZone
}

module "StorageAccount" {
  source = "./modules/Storage"
  SAName = var.SAName
  RGName        = "${module.RGCreate.ResourceGroup}"
  RGLocation    = "${module.RGCreate.ResourceGroupZone}"
}

module "MDBCreate" {
  source = "./modules/Database"

  RGName     = "${module.RGCreate.ResourceGroup}"
  RGLocation = "${module.RGCreate.ResourceGroupZone}"

  DBSName        = var.DBSName
  DBSKU_name     = var.ProInfo["DBSKU_name"]
  DBSKU_Capacity = var.ProInfo["DBSKU_Capacity"]
  DBSKU_Tier     = var.ProInfo["DBSKU_Tier"]
  DBSKU_Family   = var.ProInfo["DBSKU_Family"]
  sp_storage     = var.ProInfo["sp_storage"]
  sp_backReten   = var.ProInfo["sp_backReten"]
  sp_geoRedunt   = var.ProInfo["sp_geoRedunt"]
  admin_user     = var.admin_user
  admin_login    = var.admin_login
  dbversion      = var.ProInfo["dbversion"]
  dbSSLenf       = var.ProInfo["dbSSLenf"]
  InitDBName     = var.InitDBName
}

module "MAppCreate" {
  source        = "./modules/AppService"
  RGName        = "${module.RGCreate.ResourceGroup}"
  RGLocation    = "${module.RGCreate.ResourceGroupZone}"
  skuTier       = var.ProInfo["SKU_Tier"]
  skuSize       = var.ProInfo["SKU_Size"]
  AppName       = var.AppName
  backupStorage = "${module.StorageAccount.storage_account_URL}sitebackup${module.StorageAccount.sas_url_query_string}&sr=b"
  DatabaseConf  = "Database=${module.MDBCreate.DatabaseName};Data Source=${module.MDBCreate.Connection_HostName};User ID=${var.admin_user}@${module.MDBCreate.Connection_HostName}; Password=${var.admin_login}"
}

