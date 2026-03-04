locals {
  suffix = "${var.project}-${var.environment}-${var.region}-001"

  tags = {
    environment  = var.environment
    project      = var.project
    owner        = var.owner
    cost-center  = var.cost_center
    created-by   = "terraform"
    created-date = "2026-03-04"
  }
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${local.suffix}"
  location = var.location
  tags     = local.tags
}

resource "azurerm_static_web_app" "main" {
  name                = "stapp-${local.suffix}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku_tier            = "Free"
  sku_size            = "Free"
  tags                = local.tags
}
