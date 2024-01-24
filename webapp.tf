# Create a resource group
resource "azurerm_resource_group" "dev-rg" {
  name     = "dev-environment-rg"
  location = "South Central US"
}

# Create app service plan
resource "azurerm_app_service_plan" "service-plan" {
  name = "simple-service-plan"
  location = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  kind = "Linux"
  reserved = true
  sku {
    tier = "Standard"
    size = "S1"
  }
  tags = {
    environment = "dev"
  }
}
