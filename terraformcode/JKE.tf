resource "google_container_cluster" "jke" {
    name     = "jke"
    location = "us-central1-a"

    network = google_compute_network.vpc1.name

    subnetwork = google_compute_subnetwork.restricted_subnet.name

    remove_default_node_pool = true
    initial_node_count       = 1 
    networking_mode = "VPC_NATIVE"
    
    ip_allocation_policy {
        cluster_secondary_range_name = google_compute_subnetwork.restricted_subnet.secondary_ip_range.0.range_name
        services_secondary_range_name = google_compute_subnetwork.restricted_subnet.secondary_ip_range.1.range_name
    }

    release_channel {
        channel = "REGULAR"
    }

    network_policy {
        provider = "PROVIDER_UNSPECIFIED"
        enabled  = true
    }


    private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
    master_ipv4_cidr_block = "172.16.0.0/28"
    }

    master_authorized_networks_config {
    cidr_blocks {
        cidr_block = google_compute_subnetwork.management_subnet.ip_cidr_range
        display_name = "auth_master"
    }
}

}


resource "google_container_node_pool" "node_pool" {
    name       = "node-pool"
    location = "us-central1-a"
    cluster    = google_container_cluster.jke.name
    node_count = 1

    node_config {
    preemptible  = true
    machine_type = "g1-small"

    service_account = google_service_account.k8s-cluster.email
    oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
    ]
}
}





resource "google_service_account" "k8s-service-account" {
    account_id   = "k8s-service-account"
}

resource "google_project_iam_member" "k8s-iam-member" {
    project = "ismail-354112"
    role    = "roles/container.admin"
    member  = "serviceAccount:${google_service_account.k8s-service-account.email}"
}
resource "google_service_account" "k8s-cluster" {
    account_id   = "k8s-cluster"
}

resource "google_project_iam_member" "cluster-iam-member" {
    project = "ismail-354112"
    role    = "roles/storage.objectViewer"
    member  = "serviceAccount:${google_service_account.k8s-cluster.email}"
}