provider "google" {
  credentials = file("sapient-visitor-398015-e6a07547f590.json")
  project     = "sapient-visitor-398015"
  region      = "asia-southeast1"
  zone	      = "asia-southeast1-a"
}

resource "google_compute_address" "static" {
  name = "mahe-app"
}

resource "google_compute_firewall" "allow-firewall" {
  name    = "allow-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "vpc_network" {
  project = "sapient-visitor-398015"
  name = "mahe-network"
  auto_create_subnetworks = true
  mtu = 1460
}


resource "google_compute_instance" "mahe-app" {
  name         = "mahe-app"
  machine_type = "e2-standard-4"
  zone         = "asia-southeast1-a"
  allow_stopping_for_update = true 

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  metadata = {
    ssh-keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFFuaTl/8mDxf7d4vx0dkcGE7NAX2jim/P76m2KyceDkrjW/MwA3YBK61Y/KJ/ADN/HQ4eonBA3xUdaYeBq//ZPI6cq/9k8tnuIWO3hTuJ8B1nKFltT7ir1jHzo9lOaVZANPCSXAmyicvhOot7/vFfkpoftv8fzPhUUhbrwtJeAWptC8b22oui71hVDAhOoY32eUTGmPLrvtMXFZqL3cobAe+wI8rYQ4PlRJEN1yvHn80UUs0U4ILtmDudFeyqvy4Z7zAj+KDJwmllbyky1QA9ukp/Ot8dVG5IQAf+ee9pQ3gsQUoefJlvy2IVCZDENvW5PeaT7XpteDGFfPe29++7SY1w0t7lHM4Yhwp0XEoTpDFUQJ2Qkf+9EvStoe6Q+wOFNHHRSQ9BwbBlym5hfkssgKx55M6qecn107AKXfYit67mdtuaZu86TiQqZMzqrA0VwL/N+qUr7E1gn/+bf4zopzscRQTOJnNkkkCQssn3AOCcuA7zBa512kqhU0jYV0U= mahesa@DESKTOP-8P2CMLF"
  }
}

output "public_ip_app" {
  value = google_compute_instance.mahe-app.network_interface[0].access_config[0].nat_ip
}
