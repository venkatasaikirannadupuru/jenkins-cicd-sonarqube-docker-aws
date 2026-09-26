variable "aws_region" {
  description = "AWS region where infrastructure will be created"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for AWS resource naming"
  type        = string
  default     = "jenkins-cicd"
}

variable "vpc_cidr" {
  description = "CIDR block for the project VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zone" {
  description = "Availability Zone for the initial infrastructure"
  type        = string
  default     = "ap-south-1a"
}
variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
  default     = "linux"
}