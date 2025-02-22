terraform{
  required_version = ">=1.0"
  required_providers {
     google={
      source = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google"{
  project = var.project.id
  region = var.region
}
