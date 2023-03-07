resource "google_compute_global_address" "default" {
  project      = var.project_id
  name         = "${var.cluster_name}-${terraform.workspace}-static-ip-address"
  address_type = "EXTERNAL"
  ip_version   = "IPV4"
}