# Retrieve an access token as the Terraform runner
data "google_client_config" "provider" {}

resource "google_container_cluster" "primary" {
  name = var.cluster_name
  location = "${var.region}-a"

  initial_node_count = 1
  
  node_config {
    disk_type    = "pd-standard"
    disk_size_gb = 50
  }
  
  network = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
  remove_default_node_pool = true
  deletion_protection = false
}

resource "google_container_node_pool" "primary-nodes" {
  name = "my-node-pool"
  location = "${var.region}-a"
  cluster = google_container_cluster.primary.name
  node_count = 1
  node_config {
    machine_type = "e2-small"
    disk_type    = "pd-standard"
    disk_size_gb = 50
  }
}

provider "kubernetes" {
  host  = "https://${google_container_cluster.primary.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gke-gcloud-auth-plugin"
  }
}
