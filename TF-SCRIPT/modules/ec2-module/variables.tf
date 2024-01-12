# mmodules/ec2-module/variables.tf

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 3
}

variable "instance_types" {
  description = "Type of EC2 instance"
  type        = list(string)
}

variable "ami" {
  description = "Amazon Machine Image ID"
  type        = string
  default     = "ami-05c0f5389589545b7"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "demo-key"
}

variable "subnet_id" {
  description = "ID of the subnet where instances will be launched"
  type        = string
  default     = "subnet-0e41453c9b1028803"
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A list of maps containing tags for EC2 instances."
  type        = list(map(string))
  default     = []
}
