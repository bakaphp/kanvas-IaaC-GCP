resource "google_compute_address" "default" {
  name   = "${var.cluster_name}-${terraform.workspace}-static-ip-address"
  region = local.location
}