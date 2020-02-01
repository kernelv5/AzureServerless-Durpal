variable "ProInfo"{ 
  type = "map"
  default = {
      "RGName"    = "********" # This Resource Group should be exist 
      "RGZone"    =    "East Asia" # Resource Group Zone
      "SKU_Tier"  = "PremiumV2" # Package Information
      "SKU_Size"  = "P1v2"  # Package Information
      "AppName"   = "******"  # AppService Name
      # Ref : https://g   ithub.com/terraform-providers/terraform-provider-azurerm/blob/master/examples/app-service/backup/main.tf 
      # End context -> &sr=b
      "backupStorage" = "https://*****.blob.core.windows.net/<container_name><SAS token >=b"

      # Database Section
      "DBSName"   = "********"
      # Database Package Informations
      "DBSKU_name" = "MO_Gen5_2"
      "DBSKU_Capacity" = "2"
      "DBSKU_Tier" = "MemoryOptimized"
      "DBSKU_Family" = "Gen5"
      "sp_storage" = "102400"
      # Backup Setup Inforamtions
      "sp_backReten" = "7"

      "sp_geoRedunt" = "Disabled"

      # Credentials informations
      "admin_user" = "******"
      "admin_login" = "******"

      # Database Settings Informations
      "dbversion" = "5.6"
      "dbSSLenf" = "Disabled"
      "InitDBName" = "azpdpchshowcaseasemysqlsvr"

   }  
}