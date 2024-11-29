variable "repository_name" {
  description = "Name of the repo"
  type        = string
}

variable "backend_iam_role" {
  description = "IAM role for Terraform backend"
  type        = string
}


variable "region" {
  type        = string
  description = "Define region"
  default     = "ap-southeast-1"
}

variable "eks_cluster_name" {
  type        = string
  description = "Define region"
}
