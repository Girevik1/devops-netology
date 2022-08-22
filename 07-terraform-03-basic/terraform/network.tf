# Network
resource "yandex_vpc_network" "net-1" {
  name = "net-${terraform.workspace}"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet-${terraform.workspace}"
  zone           = local.zone["${terraform.workspace}"]
  network_id     = yandex_vpc_network.net-1.id
  v4_cidr_blocks = ["192.168.${local.subnet_ip["${terraform.workspace}"]}.0/24"]
}