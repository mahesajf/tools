
resource "google_compute_instance" "mahe-axiata" {
  boot_disk {
    auto_delete = true
    device_name = "axiata"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20230724"
      size  = 40
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-standard-2"

  metadata = {
    ssh-keys = "mahesa:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDA76Y/Okp4GOSH8/HMWqtaZVmDjRh+VemyhQdJNqORBiCcvDSyg47hrcLA9QuINq62MmbN+Trp0gbmXeQHsoB2frdTTdljArwQ7fJCxXKUnKuXXOzjKMGdkIClS8E2R+Gqd0SmfVG+5FTpZHJFSNrrf4Kw0UgzP6i0MBUtDqWr6dScXq1CimMnaepiNG01WqVe6SbQlEkwPnjVX/NvArx0biAfIIYdqF21cBP7z4R6rpaK59N1z+htKUdpR86Rqj9kEd32oJSIGogasjQDg4LS8IlgYtHqRERJL4Fl7Pwvn4QUzTEFK/czZHCC7SV6e0vn3e6JHe2vqcoPyvSm3AlA2hAH0DGiK+tLwtunuDEvLfeqwFD3UQftXjqMbTDKgkDVgElSqFyBR1c6BP3eBMJcwRX+bKmUarXoZCtBTfIW0MFJOThEaCIYklSYSxzyealVACleE7gdWPnzXuIrTHap3t1CbSlN2WV8VjlqswZ4MFlH7CHvQh4SvRIYpdQUzB8= mahesa@DESKTOP-8P2CMLF"
  }

  name = "mahe-axiata"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/fluid-tuner-391713/regions/us-west4/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "31922766302-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server"]
  zone = "us-west4-b"
}
