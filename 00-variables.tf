variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "instance_count" {
  description = "Number of EC2 instance to create"
  type = number
  default = 4
  # type = list(string)
  # default = ["Stop-Instance", "Start-Instance", "Reboot-Instance", "Terminate-Instance" ]
}

variable "instance_names" {
  description = "Names for the EC2 instances"
  type = list(string)
  default = ["Metallica-Instance", "Megadeth-Instance", "Anthrax-Instance", "Slayer-Instance"]
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default = "10.11.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default = "10.11.11.0/24"
}