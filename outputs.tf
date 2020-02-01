output "Database_Server_Connection_Details" {
  description = "Fully Qualified Domain Name (FQDN) of the Azure SQL Database created."
  value       = "${module.MDBCreate}"
}
