variable "tag" {
  type = string 
  default = "customvpc"
}
variable "environment" {
  type = string
  default = "development"
}

variable "instance_type" {
type = string
  
}
variable "availability_zone" {
type = list 
}
variable "key_name" {
type = string
  
}
variable "subnet_id" {
type = any 
}
variable "vpc_id" {
  type = string
}