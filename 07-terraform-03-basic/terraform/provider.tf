terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

#  backend "s3" {
#    endpoint   = "storage.yandexcloud.net"
#    bucket     = "ys3"
#    region     = "ru-central1"
#    key        = "tf.tfstate"
#    access_key = var.s3_access_key
#    secret_key = var.s3_secret_key
#
#    skip_region_validation      = true
#    skip_credentials_validation = true
#  }

}

provider "yandex" {
#  service_account_key_file = var.service_account_id
  token                    = var.yandex_token
  cloud_id                 = var.yandex_cloud_id
  folder_id                = var.yandex_folder_id
  zone                     = local.zone["${terraform.workspace}"]
}