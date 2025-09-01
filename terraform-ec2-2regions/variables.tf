variable "aws_regions" {
  description = "List of AWS regions to deploy EC2 instances"
  type        = list(string)
  default     = ["us-east-1", "ap-south-1"]
}

variable "key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
  default     = "terraform-ec2-key"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_map" {
  description = "Map of region to AMI ID (Amazon Linux 2)"
  type        = map(string)
  default = {
    "us-east-1"   = "ami-0c02fb55956c7d316"
    "ap-south-1"  = "ami-0b0dcb5067f052a63"
  }
}
