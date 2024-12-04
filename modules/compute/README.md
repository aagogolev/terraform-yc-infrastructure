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
| [yandex_compute_instance.vm](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | Boot disk size in GB | `number` | `20` | no |
| <a name="input_boot_disk_type"></a> [boot\_disk\_type](#input\_boot\_disk\_type) | Boot disk type (network-hdd, network-ssd) | `string` | `"network-ssd"` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | Boot disk image ID | `string` | n/a | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances to create | `number` | `1` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix for instance names | `string` | n/a | yes |
| <a name="input_nat"></a> [nat](#input\_nat) | Provide a public address | `bool` | `true` | no |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | Platform ID (standard-v1, standard-v2, standard-v3) | `string` | `"standard-v3"` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Computing resources configuration | <pre>object({<br>    cores         = number<br>    memory        = number<br>    core_fraction = number<br>  })</pre> | <pre>{<br>  "core_fraction": 100,<br>  "cores": 2,<br>  "memory": 4<br>}</pre> | no |
| <a name="input_ssh_public_key_path"></a> [ssh\_public\_key\_path](#input\_ssh\_public\_key\_path) | Path to SSH public key file | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | SSH user for instance access | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for network interface | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Yandex Cloud Zone | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ips"></a> [external\_ips](#output\_external\_ips) | Public IP addresses of instances |
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | IDs of created instances |
| <a name="output_internal_ips"></a> [internal\_ips](#output\_internal\_ips) | Private IP addresses of instances |
<!-- END_TF_DOCS -->
