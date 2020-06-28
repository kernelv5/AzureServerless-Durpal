resource "azurerm_storage_account" "storageaccountname" {
  name                     = "${var.SAName}"
  resource_group_name      = "${var.RGName}"
  location                 = "${var.RGLocation}"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "SContainerType" {
  name                  = "sitebackup"
  storage_account_name  = azurerm_storage_account.storageaccountname.name
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "BackupChannelAccess" {
  connection_string = azurerm_storage_account.storageaccountname.primary_connection_string
  https_only        = true

  resource_types {
    service   = false
    container = false
    object    = true
  }


  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = timestamp()
  expiry = timeadd(timestamp(), "8760h") # 8760h one year

  permissions {
    read    = true
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = false
    process = false
  }
}

