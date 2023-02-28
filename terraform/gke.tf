resource "google_container_cluster" "primary" {
  name               = "${var.cluster_name}-${terraform.workspace}"
  location           = local.location
  initial_node_count = 1
  enable_autopilot   = true
  network            = var.network_name
  subnetwork         = "kanvas-cluster-private-subnet-1"
  networking_mode    = "VPC_NATIVE"
  ip_allocation_policy {}

  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = data.google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    tags = ["kanvas-node"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}