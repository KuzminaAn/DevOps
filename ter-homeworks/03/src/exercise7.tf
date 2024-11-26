resource "random_string" "network_id" {
  length  = 16
  special = false
}

resource "random_string" "subnet_ids" {
  count   = 4
  length  = 16
  special = false
}

resource "random_string" "subnet_zones" {
  count = 4
  length = 12
  special = false
}

locals {
  vpc = {
    network_id  = random_string.network_id.result
    subnet_ids   = [for id in random_string.subnet_ids : id.result]
    subnet_zones = [
      "ru-central1-a",
      "ru-central1-b",
      "ru-central1-c",
      "ru-central1-d",
    ]
  }
}


# итоговое выражение 
#{network_id = local.vpc.network_id, subnet_ids = concat(slice(local.vpc.subnet_ids, 0, 2), slice(local.vpc.subnet_ids, 3, length(local.vpc.subnet_ids))), subnet_zones = concat(slice(local.vpc.subnet_zones, 0, 2), slice(local.vpc.subnet_zones, 3, length(local.vpc.subnet_zones)))}
