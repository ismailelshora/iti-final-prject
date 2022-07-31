resource "google_compute_instance" "vmprivt" {
    name = "vmprivt"
    machine_type = "f1-micro"
    zone = "us-central1-a"
    tags = ["ssh"]//adding this tag to assign the ssh firewall to this instances only 
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }
    network_interface {
        subnetwork  = google_compute_subnetwork.management_subnet.self_link
        network_ip = "10.0.0.2"
    }
    service_account {
    email  = google_service_account.k8s-service-account.email
    scopes = ["cloud-platform"]
    }
    
}