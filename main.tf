provider "google" {
    project = "devops-489105"
    region = "us-central1"
    zone = "us-central1-a"
}

resource "google_compute_instance" "maven_vm" {
    name = "maven-vm"
    machine_type = "e2-medium"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }
    network_interface {
        network = "default"
        access_config {}
    }
    metadata_startup_script = <<-EOF
    #!/bin/bash
    apt update
    apt install -y openjdk-11-jdk maven
    EOF
}

resource "google_compute_instance" "sonar_vm" {
    name = "sonar_vm" 
    machine_type = "e2-medium"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }
    network_interface {
        network = "default"
        access_config {}
    }
    metadata_startup_script = <<-EOF
    #!/bin/bash
    apt update
    apt install -y openjdk-11-jdk unzip wget
    wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.3.79811.zip
    EOF
}
resource "google_compute_instance" "docker_vm" {
    name = "docker-vm"
    machine_type = "e2-medium"

    boot_disk {
        initialize_params {
          image = "debian-cloud/debian-11"
        }
    }
    network_interface {
        network = "default"
        access_config {}
        
    }
    metadata_startup_script = <<-EOF
    #!/bin/bash
    apt update
    apt install -y docker.io
    systemctl start docker
    EOF
}
