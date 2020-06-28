output "sas_url_query_string" {
  value = data.azurerm_storage_account_sas.BackupChannelAccess.sas
}

output "storage_account_URL" {
    value = azurerm_storage_account.storageaccountname.primary_blob_endpoint
}
