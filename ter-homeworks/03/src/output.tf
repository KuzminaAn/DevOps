output "vm_list" {
  value = concat(
    [
      for inst in yandex_compute_instance.web : {
        name = inst.name
        id   = inst.id
        fqdn = format("%s.%s.%s", inst.hostname != "" ? inst.hostname : format("%s-%d", inst.name, index(yandex_compute_instance.web, inst)),var.default_zone, var.vm_fqdn)
      }
    ],
    [
      for inst in yandex_compute_instance.database : {
        name = inst.name
        id   = inst.id
        fqdn = format("%s.%s.%s", inst.hostname != "" ? inst.hostname : format("%s-%d", inst.name, index(yandex_compute_instance.database, inst)),var.default_zone, var.vm_fqdn)
      }
    ]
  )
}
