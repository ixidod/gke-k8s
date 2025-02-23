#create a Service Account gor gke
resource "google_service_account" "gke_sa" {
  account_id   = "gke-service-account"
  display_name = "GKE Service Account"
}

#assign necessary IAM roles to the Service Account
resource "google_project_iam_binding" "gke_roles" {
  project = var.project_id
  role    = "roles/container.admin" # grants full controll over cluster
  members = ["serviceAccount:${google_service_account.gke_sa.email}"]

}


