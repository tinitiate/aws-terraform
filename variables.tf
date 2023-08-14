variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "client" {
  description = "Client name"
  type        = string
}

variable "environment" {
  description = "Environment (dev, prod, etc.)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "resources_count" {
  description = "Number of resources to create"
  default     = 1
}

variable "instance_type" {
  description = "Type of the Instance"
  type        = string
}

variable "volume_size" {
  description = "Size of the ebs volume"
  type        = number
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-2a"]  # Update with your desired availability zones
}
