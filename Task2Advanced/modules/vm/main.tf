terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoints = {
      s3 = var.s3_endpoint
    }
    bucket = var.s3_bucket
    region = var.s3_region
    key    = var.s3_key

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_vpc_network" "default" {
  name = var.network
}

resource "yandex_vpc_subnet" "default" {
  network_id     = yandex_vpc_network.default.id
  name           = var.subnet
  v4_cidr_blocks = var.subnet_v4_cidr_blocks
  zone           = var.zone
}

data "yandex_compute_image" "default" {
  family = var.image_family
}


resource "yandex_compute_instance" "default" {
  name     = var.name
  hostname = var.hostname
  zone     = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.default.id
      size     = var.disk_size
      type     = var.disk_type
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = var.nat
  }


  metadata = {
    ssh-keys = "${var.user_name}:${file(var.ssh_key_path)}"
  }

  timeouts {
    create = var.timeout_create
    delete = var.timeout_delete
  }
}


