variable "ec2_key_name" {
  description = "EC2 key name"
  type        = string
  default     = "tf-pipeline-key"
}

variable "aws_key_pub" {
  description = "SSH public key"
  type        = string
}

variable "ec2_type" {
  description = "EC2 type"
  type        = string
  default     = "t2.micro"
}
