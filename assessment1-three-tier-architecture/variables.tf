variable "resource_group_name" {
  type="string"
  default="test-rg"
}

variable "resource_group_location" {
  type="string"
  default="westus"
}

variable "availability_set_name" {
  type="string"
  default="webserver"
}

variable "admin_username" {
  type="string"
  default = "terraformuser"
}
