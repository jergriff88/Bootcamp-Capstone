variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-west-1"
}

variable "project_name" {
  description = "Name used to identify capstone resources"
  type        = string
  default     = "bootcamp-capstone"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the capstone VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.20.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for the Linux automation target"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair created for the capstone"
  type        = string
  default     = "bootcamp-capstone-key"
}

variable "public_key_path" {
  description = "Path to the SSH public key on the Ansible controller"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_allowed_cidr" {
  description = "IPv4 CIDR allowed to connect to the Linux host over SSH"
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0))
    error_message = "ssh_allowed_cidr must be a valid IPv4 CIDR, such as 203.0.113.10/32."
  }
}