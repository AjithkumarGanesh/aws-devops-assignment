# variables

variable "aws_region" {
  description = "insatnce_deployment_region"
  type        = string
  default     = "ap-south-1"
}

variable "aws_instance_type" {
  description = "instance type"
  type        = string
  default     = "t3.micro"
}

variable "project_tags" {
  description = "common project tags"
  type        = map(string)
  default = {
    Owner   = "Ajithkumar"
    Project = "devops-assignment"
  }
}

variable "public_az" {
  description = "Availability Zone for the public subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "private_az" {
  description = "Availability Zone for the private subnet"
  type        = string
  default     = "ap-south-1b"
}
