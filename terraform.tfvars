deploy = {
  location = "mel" # mel (Region 1 - Australia Southeast) or syd (Region 2 - Australia East)
}

env      = "dev"
refName  = "poc"
instance = "01"
#azurerm_subnet_name   = "Data"
#virtual_network_name  = "vnt-dev-r1-demo-01"
resource_group_name   = "arg-dev-r1-demo-01"


#######################################################

# Declare tags
costCentre            = "11-3552-86105-355108-0000"
service               = "<SERVICE>"
serviceDescription    = "Azure resoruces for the SERVICE"
serviceOwner          = "Matt Stokeld"
serviceOwnerGroup     = "IMTD - Infrastructure Engineering"
technicalContact      = "Ravneet Chalana"
technicalContactGroup = "IMTD - Infrastructure Engineering"

#######################################################
