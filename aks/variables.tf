variable "name" {
  type = string
  default = "shivamtf"
}

variable "resource_group_name" {
  type = string
  default = "shivam-tf-test"
}

variable "location" {
  type = string
  default = "westeurope"
}

variable "node_count" {
  type = string
  default = 1
}

  variable "k8s_version" {
    type = string
    default = "1.28.0"
  }