resource "google_compute_router_nat" "natgateway" {
    name                               = "natgateway"
    router                             = google_compute_router.router.name
    region                             = google_compute_router.router.region
    nat_ip_allocate_option             = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    subnetwork {                                                
    name     = google_compute_subnetwork.management_subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"] 
    }
}

resource "google_compute_router" "router" {
  name    = "router"
  region  = google_compute_subnetwork.management_subnet.region
  network = google_compute_network.vpc1.id

  bgp {
    asn = 64514
  }
}