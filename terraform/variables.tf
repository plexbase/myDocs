variable "environment" {
  description = "Deployment environment (e.g. dev, test, prod)"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name used in resource names and tags"
  type        = string
  default     = "demoapp01"
}

variable "region" {
  description = "Azure region short name used in resource names"
  type        = string
  default     = "sc"
}

variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "swedencentral"
}

variable "owner" {
  description = "Owner tag value"
  type        = string
  default     = "kjetil"
}

variable "cost_center" {
  description = "Cost center tag value"
  type        = string
  default     = "it-infrastructure"
}
