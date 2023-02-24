variable "project_id" {
  type        = string
  description = "The project id on GCP"
  default     = "default"
}

variable "cluster_name" {
  type        = string
  description = "The cluster name"
  default     = "kanvas-cluster"
}

variable "network_name" {
  type        = string
  description = "The network name"
  default     = "default"
}

variable "service_account_id" {
  type        = string
  description = "Service Account Id"
  default     = "23234234235245345345"
}