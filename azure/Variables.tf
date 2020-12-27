variable "azure_resource_group_name" {
    description = "Resource Group Name"
    default = "myrg"
}

variable "vm_name_prefix" { 
	description = "The Virtual Machine Name"
    default = "myvm"
}

variable "vm_count" {
    description = "Number of VMs to create"
    default = "2"
}

variable "vm_size" { 
	description = "Azure VM Size"
    default = "Standard_DS1_v2"
}

variable "vm_winrm_port" {
    description = "WinRM Public Port"
    default = "5986"
}

variable "azure_region" {
    description = "Azure Region for all resources"
    default = "germanywestcentral"
}

variable "azure_region_fullname" {
    description = "Long name for the Azure Region, ie. North Europe"
    default = "Germany West Central"
}

variable "azure_dns_suffix" {
    description = "Azure DNS suffix for the Public IP"
    default = "cloudapp.azure.com"
}

variable "admin_username" {
    description = "Username for the Administrator account"
    default = "Boris"
}

variable "admin_password" {
    description = "Password for the Administrator account"
    default = "666BoriS666!"
}

variable "environment_tag" {
    description = "Tag to apply to the resoucrces"
    default = "test"
}

