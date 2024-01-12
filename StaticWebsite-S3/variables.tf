variable "aws_region" {
  type = string
}

variable "prefix" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags you want applied to all components"
}