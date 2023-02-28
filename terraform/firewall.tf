resource "google_compute_firewall" "kubernetes_ingress_rules" {
  name      = "${var.cluster_name}-${terraform.workspace}-ingress-rules"
  network   = var.network_name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["3306", "6379", "5672", "587"]
  }

  target_tags = ["kanvas-node"]
  source_tags = ["kanvas-node"]

  destination_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "kubernetes_egress_rules" {
  name      = "${var.cluster_name}-${terraform.workspace}-egress-rules"
  network   = var.network_name
  direction = "EGRESS"

  allow {
    protocol = "tcp"
    ports    = ["3306", "6379", "5672", "587"]
  }

  target_tags = ["kanvas-node"]

  destination_ranges = ["0.0.0.0/0"]
}