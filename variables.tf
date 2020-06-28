# ./terraform plan -var="RGName="PD-LFAD-LLOYD.SHOWCASE-RG" \
# -var="RGZone=East Asia" \
# -var="AppName=LLOYDSHOWCASE" \
# -var="SAName=LLOYDSHOWCASE" \
# -var="SAName=LLOYDSHOWCASE" \
# -var="admin_user=LLOYDSHOWCASE" \
# -var="admin_login=!0191!fu?"

# Configurable Variables
variable "RGName" {}
variable "RGZone" {}
variable "AppName" {}

# Storage Account Section
variable "SAName" {}
variable "DBSName" {}
variable "InitDBName" {}
variable "admin_user" {}
variable "admin_login" {}

# Standard Variables
variable "ProInfo" {
  type = map(string)
  default = {
    "SKU_Tier" = "PremiumV2"
    "SKU_Size" = "P1v2"
    # Database Section
    "DBSKU_name"     = "MO_Gen5_2"
    "DBSKU_Capacity" = "2"
    "DBSKU_Tier"     = "MemoryOptimized"
    "DBSKU_Family"   = "Gen5"
    "sp_storage"     = "102400"
    "sp_backReten"   = "7"
    "sp_geoRedunt"   = "Disabled"
    "dbversion"      = "5.6"
    "dbSSLenf"       = "Disabled"
  }
}

