resource "google_compute_network" "vpc1" {
  name                    = "vpc1"
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"

}


resource "google_compute_subnetwork" "management_subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc1.id
}

resource "google_compute_subnetwork" "restricted_subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc1.id
  secondary_ip_range {
  range_name    = "pods"
  ip_cidr_range = "192.168.0.0/24"
  }
  secondary_ip_range {
  range_name    = "nodes"
  ip_cidr_range = "192.168.1.0/24"
  }

}