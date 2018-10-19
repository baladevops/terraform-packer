###### AZURE section start

variable "client_id" { "ca9d7487-c484-49a2-b7a0-4b0a4cf12d9b" }
variable "client_secret" { "bcc0f396-5a5e-4231-a951-c7e8677f7933" }
variable "tenant_id" { "2c1f8453-5cc2-44f7-a93f-49ab55dcaab8" }
variable "subscription_id" { "3216b735-086e-46b2-9363-44095f8213e1" }

variable "computer_name" {
  description = "Machine_name"
  default = "eureka-server"
}

variable "admin_username" {
  description = "Machine_user_name"
  default = "baladevops"
}

variable "admin_password" {
  description = "Machine_password"
  default = "bala@minds"
}

variable "resource_group" {
  description = "abc-sg"
}

variable "vm_size" {
  description = "Virtual Machine size"
  default = "Standard_D2_v3"
}

###### AZURE section end






