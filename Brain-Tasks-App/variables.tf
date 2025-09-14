variable "region1" {
  description = "First AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "region2" {
  description = "Second AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Base name for keypairs created in each region"
  type        = string
  default     = "terraform-ec2-key"
}

variable "public_key_file" {
  description = "Public key file name in this module path (created earlier)"
  type        = string
  default     = "terraform-ec2-key.pub"
}

variable "allowed_ssh_cidr" {
  description = "CIDR range allowed for SSH (change to your IP for security)"
  type        = string
  default     = "0.0.0.0/0"
}
