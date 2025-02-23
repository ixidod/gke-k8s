variable "project_id" {
  description = "k8s-gozd"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-west1"
}

variable "cluster_name" {
  description = "GKE cluster"
  type        = string
  default     = "gke-k8s"
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "GKE node mochine type"
  type        = string
  default     = "e2-standard-4"
}
