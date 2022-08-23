
locals {

  zone = {
    stage = "ru-central1-a"
    prod  = "ru-central1-b"
  }

  instance_count = {
    stage = 1
    prod  = 2
  }

  cpu_count = {
    stage = 1
    prod  = 2
  }

  mem_size = {
    stage = 1
    prod  = 2
  }

  disk_size = {
    stage = 50
    prod  = 50
  }

  instance_type = {
    stage = "standard-v1"
    prod  = "standard-v2"
  }

  for_each_inst_count = {
    stage = { count = 1 }
    prod  = { count = 2 }
  }

  subnet_ip = {
    stage = 101
    prod  = 90
  }
}

# Create yandex_compute_instance_group

resource "yandex_compute_instance_group" "group01" {
  service_account_id              = var.yandex_token
  name               = terraform.workspace
  folder_id          = var.yandex_folder_id

  for_each = local.id
  name = "vm-${each.key}-${terraform.workspace}"

  deploy_policy {
    max_expansion   = local.instance_count["${terraform.workspace}"]
    max_unavailable = local.instance_count["${terraform.workspace}"]
  }

  scale_policy {
    fixed_scale {
      size = local.instance_count["${terraform.workspace}"]
    }
  }

  instance_template {
    platform_id = local.instance_type["${terraform.workspace}"]
    resources {
      cores  = local.mem_size["${terraform.workspace}"]
      memory = local.mem_size["${terraform.workspace}"]
    }

    boot_disk {
      initialize_params {
        image_id = var.centos-7-base
        type     = "network-nvme"
        size     = local.disk_size["${terraform.workspace}"]
      }

    }

    network_interface {
      subnet_ids = ["${yandex_vpc_subnet.subnet-1.id}"]
      nat        = true
    }

    metadata = {
      #      ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
      user-data = "${file("./meta.yml")}"
    }

  }

  allocation_policy {
    zones = ["${local.zone["${terraform.workspace}"]}"]
  }
}

#resource "yandex_storage_bucket" "terraform_state" {
#  bucket = "ys3-${terraform.workspace}"
#}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "yans3"
    region     = "ru-central1"
    key        = "env://${terraform.workspace}/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true

    access_key = var.s3_access_key
    secret_key = var.s3_secret_key
  }
}



# resource "yandex_storage_bucket" "test" {
#  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
#  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
#  bucket = "tf-test-bucket"
# }