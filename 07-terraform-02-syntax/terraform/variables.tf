# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  type        = string
  default = ""
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  type        = string
  default = ""
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "centos-7-base" {
  type        = string
  default = ""
}

variable "yandex_token" {
  description = "Yandex Cloud OAuth-token "
  type        = string
  default     = ""
}