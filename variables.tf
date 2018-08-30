variable "aws_account_id" {
  description = "AWS account id"
}

variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "app_version" {
  description = "Code Version to be deployed"
  default     = "1.0.0"
}

variable "env" {
  description = "deployed to this env"
  default     = "dev"
}

