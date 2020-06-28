output "ResourceGroup" {
  value = "${azurerm_resource_group.RGObjName.name}"
}

output "ResourceGroupZone" {
  value = "${azurerm_resource_group.RGObjName.location}"
}