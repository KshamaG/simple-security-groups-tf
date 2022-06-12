
variable "region" {
  description = "Name of the region."
  type        = string
  default     = "us-east"
}

variable "vpc_id" {
  description = "ID of the vpc."
  type        = string
  default     = null
}