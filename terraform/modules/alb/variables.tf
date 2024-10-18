variable "name" {
  description = "The name of the ALB"
  default     = "app-lb"
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
}

variable "security_group_id" {
  description = "Security group for the ALB"
}

variable "subnet_ids" {
  description = "Subnets where the ALB will be deployed"
  type        = list(string)
}

variable "target_group_name" {
  description = "The name of the ALB target group"
  default     = "app-tg"
}
