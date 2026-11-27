variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "public_az" {
  description = "Availability Zone for public subnet"
  type        = string
}

variable "private_az" {
  description = "Availability Zone for private subnet"
  type        = string
}

variable "project_tags" {
  description = "Common project tags"
  type        = map(string)
}
