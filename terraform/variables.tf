###### AZURE section start

variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}

variable "computer_name" {
  description = "Machine_name"
  default = "eureka-server"
}

variable "admin_username" {
  description = "Machine_user_name"
  default = "please input your value"
}

variable "admin_password" {
  description = "Machine_password"
  default = "please inpuut your vaule"
}

variable "resource_group" {
  description = "Resource Group"
}

variable "vm_size" {
  description = "Virtual Machine size"
}

###### AZURE section end






