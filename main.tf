provider "azurerm" {
  features {}
}   


provider "azuread" {
  tenant_id = "d96cb337-1a87-44cf-b69b-3cec334a4c1f"
}

provider "azurerm" {
  features {}

  alias           = "CoreServices"
  subscription_id = "dca0ca16-7ea7-4948-b7df-f3afb0803f5e"
}
#############################################
data "azurerm_resource_group" "arg" {
  name      = "arg-dev-r1-Marktest-01"
  #name     = "arg-${var.env}-${var.location[var.deploy.location].code}-${var.refName}-${var.instance}"
  #location = var.location[var.deploy.location].region
}


############################################################

resource "azurerm_virtual_network" "vnt" {
  name                = "vnt-dev-r1-demo-01"
  location            =  var.location[var.deploy.location].region
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.arg.name

  #tags = local.default_tags
}


# Query - existing subnet

resource "azurerm_subnet" "sbnt" {
  #for_each             = toset([for k, v in var.akvList : v.subnetName])
  name                 = "vmsubnet"
  resource_group_name  = azurerm_resource_group.arg.name
  virtual_network_name = azurerm_virtual_network.vnt.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [azurerm_virtual_network.vnt]
}

resource "azurerm_subnet" "pepakvsbnt" {
  #for_each             = toset([for k, v in var.akvList : v.subnetName])
  name                 = "Data"
  resource_group_name  = azurerm_resource_group.arg.name
  virtual_network_name = azurerm_virtual_network.vnt.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [azurerm_virtual_network.vnt]
}
#######################################################
# create Private DNS Zone 

resource "azurerm_private_dns_zone" "dnszone" {
  #provider = azurerm.CoreServices

  for_each            = var.azurePrivateDNS
  name                = each.value
  resource_group_name = azurerm_resource_group.arg.name

  #tags = local.default_tags
}


#######################################################
