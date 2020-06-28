output "Database_Server_Connection_Details" {
  description = "Fully Qualified Domain Name (FQDN) of the Azure SQL Database created."
  value       = module.MDBCreate
}

output "SiteURL" {
  description = "Please access this url with https and complete the installtion using above database connection"
  value = module.MAppCreate.SiteURL
}