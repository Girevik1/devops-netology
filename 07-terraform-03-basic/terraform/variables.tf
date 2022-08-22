# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = ""
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = ""
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "centos-7-base" {
  default = ""
}

variable "service_account_id" {
  default = ""
}

variable "s3_secret_key" {
  default = ""
}
variable "s3_access_key" {
  default = ""
}

variable "yandex_token" {
  description = "Yandex Cloud OAuth-token "
  type        = string
  default     = ""
}