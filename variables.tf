variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "CIDR VPC"
}

variable "vpc_additional_cidrs" {
  type        = list(string)
  description = "List additional CDRS's VPC"
  default     = []
}

variable "public_subnets" {
  description = "List public subnets of VPC"
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "private_subnets" {
  description = "List private subnets of VPC"
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "database_subnets" {
  description = "Lista de Database Subnets da VPC"
  default     = []
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}