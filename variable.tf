variable "location" {
  type        = map(any)
  description = "Location information for the resources"
  default = {
    "mel" = {
      code   = "r1",
      region = "Australia Southeast"
    }
    "syd" = {
      code   = "r2",
      region = "Australia East"
    }
  }
}


variable "deploy" {
  type        = map(any)
  description = "Location to be reployed"
  
  }


variable "env" {
  type        = string
  description = "Environment code for the resource"
  
}

variable "refName" {
  type        = string
  description = "Reference name for the application/Service"
  

}

variable "instance" {
  type        = string
  description = "Instance number for the resource"
  
}

variable "azurePrivateDNS" {
  type        = map(any)
  description = "Azure Private DNS mapping"
  default = {
    "sites"     = "privatelink.azurewebsites.net"
    "blob"      = "privatelink.blob.core.windows.net"
    "sqlServer" = "privatelink.database.windows.net"
    "file"      = "privatelink.file.core.windows.net"
    "queue"     = "privatelink.queue.core.windows.net"
    "table"     = "privatelink.table.core.windows.net"
    "vault"     = "privatelink.vaultcore.azure.net"
    "web"       = "privatelink.web.core.windows.net"
  }
}



variable "resource_group_name" {
  type = string
}
########################################################

# Variables - Common Tags
variable "costCentre" {}
variable "service" {}
variable "serviceDescription" {}
variable "serviceOwner" {}
variable "serviceOwnerGroup" {}
variable "technicalContact" {}
variable "technicalContactGroup" {}
