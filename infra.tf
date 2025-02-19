provider "google" {
  project = "SEU_PROJETO"
  region  = "us-central1"
}

resource "google_compute_instance" "vm_mysql" {
  name         = "mysql-server"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<EOT
  sudo apt update
  sudo apt install -y ansible
  EOT
}
