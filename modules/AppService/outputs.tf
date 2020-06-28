output "SiteURL" {
  value = "${azurerm_app_service.appS.default_site_hostname}"
}