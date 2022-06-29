provider "google" {
  project = var.GCP_PROJECT
  region  = var.GCP_REGION
  zone    = var.GCP_ZONE
}

locals {
  labels = { service = "ztocc" }
  name   = "cloudcraft"
}

resource "google_compute_instance" "cloudcraft_server" {
  name         = "${local.name}-server"
  machine_type = "e2-medium"
  zone         = var.GCP_ZONE
  labels       = local.labels

  network_interface {
    network = "default"
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      type  = "pd-ssd"
    }
  }
}
