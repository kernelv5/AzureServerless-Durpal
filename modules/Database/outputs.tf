output "Database_UserName" {
  value       = "${azurerm_mysql_server.appMySQL.administrator_login}@${azurerm_mysql_server.appMySQL.name}"
}
output "Database_Password" {
  value       = "${azurerm_mysql_server.appMySQL.administrator_login_password}"
}
output "Connection_HostName" {
  value       = "${azurerm_mysql_server.appMySQL.fqdn}"
}

output "DatabaseName" {
  description = "Connection string for the Azure SQL Database created."
  value       = "${azurerm_mysql_database.InitDatabase.name}"
}
