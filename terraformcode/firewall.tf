resource "google_compute_firewall" "allow-ssh" {
    name        = "ssh-firewall"
    network     = google_compute_network.vpc1.name
    description = "Creates firewall rule allow to ssh from anywhere"
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["ssh"]//adding target tags to specify this firewall to only instances have it
    allow {
    protocol  = "tcp"
    ports     = ["22"]
    }
}