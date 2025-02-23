#create gke cluster 
resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region

  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet.id

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
  }
  # this shit is handy no more gcloud to enable apis...
  depends_on = [
    google_project_service.compute,
    google_project_service.container,
    google_project_service.iam,
    google_project_service.cloudresourcemanager
  ]
}

#create a managed node pool for gke cluster
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.gke.id
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    preemptible  = false
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}


