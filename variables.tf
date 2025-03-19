# virtual_machine
variable "name" {
  type        = string
  description = "Name for the virtual machine. Must not contain uppercase maximum of 15 characters length"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group inside which the VM will be created in"
}

variable "location" {
  type        = string
  description = "Location of the resource group. Must be one of following, Central India or South India"
}

variable "vm_size" {
  type        = string
  description = "Specifies the size of the Virtual Machine.Refer documentation for all options"
}

variable "admin_username" {
  type        = string
  description = "Specifies the name of the local administrator account."

}

variable "license_type" {
  type        = string
  description = "The License type for Windows VM . Must be one of the values [None, Windows_Client, Windows_Server]"

}
variable "image_id" {
  type        = string
  description = "The License type for Windows VM . Must be one of the values [None, Windows_Client, Windows_Server]"

}
variable "secure_boot_enabled" {
  type = string

}
# os_disk
variable "storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS"
  default     = "Standard_LRS"
}

variable "disk_size_gb" {
  type        = string
  description = "The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."

}




# azurerm_network_interface
variable "ip_name" {
  type        = string
  description = "A name used for this IP Configuration."
  default     = "internal"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet where this Network Interface should be located in. Select subnet according to factors 1.application server (appsubnet) 2. web server (websubnet) 3. database server (dbsubnet)"
}

variable "private_ip_address_allocation" {
  type        = string
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static"
  default     = "Dynamic"
}

# azurerm_network_security_rule
variable "nsg_rules" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_address_prefix      = string
    source_port_range          = string
    destination_address_prefix = string
    destination_port_range     = string
  }))
  default = {
    "https" = {
      access                     = "Deny"
      destination_address_prefix = "*"
      destination_port_range     = "443"
      direction                  = "Inbound"
      name                       = "deny-https"
      priority                   = 100
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
    }
  }
}

# azurerm_recovery_services_vault
variable "recovery_services_vault_name" {
  type        = string
  description = "name of the recover service vault"
}
variable "services_vault_resource_group_name" {
  type        = string
  description = "name of resource group where the recovery service vault reside in"
}
variable "keyvault_name" {
  type        = string
  description = "name of keyvault where VM password will be stored in"
}

# lb nic
variable "lbsubnet_id" {
  type        = string
  description = "name of keyvault where VM password will be stored in"
}

# lb

variable "lb_sku" {
  type        = string
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic"
  default     = "Standard"
}

variable "lb_sku_tier" {
  type        = string
  description = "The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional"
  default     = "Regional"
}

variable "probe_ports" {
  type        = number
  description = "(optional) describe your variable"
  default     = "443"
}

