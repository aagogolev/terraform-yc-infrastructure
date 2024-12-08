<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.134.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_disk.additional_disk](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_disk) | resource |
| [yandex_compute_instance.vm](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instances"></a> [instances](#input\_instances) | Список виртуальных машин для создания | <pre>map(object({<br>    name          = string<br>    zone          = string<br>    image_id      = string<br>    cores         = number<br>    memory        = number<br>    disk_size     = number<br>    nat           = optional(bool, false)<br>    preemptible   = optional(bool, false)<br>    description   = optional(string, "")<br>    platform_id   = optional(string, "standard-v1")<br>    core_fraction = optional(number, 100)<br>    disk_type     = optional(string, "network-ssd")<br>    labels        = optional(map(string), {})<br>    additional_disks = optional(list(object({<br>      size = number<br>      type = string<br>    })), [])<br>    network_interfaces = list(object({<br>      subnet_id = string<br>      nat       = optional(bool, false)<br>    }))<br>    service_account_id = optional(string, null)<br>    placement_group_id = optional(string, null)<br>  }))</pre> | n/a | yes |
| <a name="input_ssh_key_path"></a> [ssh\_key\_path](#input\_ssh\_key\_path) | Путь к публичному SSH ключу | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_ssh_username"></a> [ssh\_username](#input\_ssh\_username) | Имя пользователя для SSH-доступа | `string` | `"yc-user"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ips"></a> [external\_ips](#output\_external\_ips) | External IP addresses of created instances |
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | IDs of created instances |
| <a name="output_internal_ips"></a> [internal\_ips](#output\_internal\_ips) | Internal IP addresses of created instances |
<!-- END_TF_DOCS -->
