# create a custom Virtual Private Cloud (VPC)
resource "google_compute_network" "vpc" {
  name                    = "gke-vpc"
  auto_create_subnetworks = false
}

# define subnet within VPC 
resource "google_compute_subnetwork" "subnet" {
  name          = "gke-subnet"
  network       = google_compute_network.vpc.id
  region        = var.region
  ip_cidr_range = "10.0.0.0/16" #subnet range for nodes
}
