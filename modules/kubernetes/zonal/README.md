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
| [yandex_iam_service_account.cluster_sa](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_iam_service_account.node_sa](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_kubernetes_cluster.zonal_cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster) | resource |
| [yandex_kubernetes_node_group.node_groups](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_node_group) | resource |
| [yandex_resourcemanager_folder_iam_member.cluster_roles](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_member) | resource |
| [yandex_resourcemanager_folder_iam_member.node_roles](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Автоматическое обновление мастера | `bool` | `true` | no |
| <a name="input_cluster_description"></a> [cluster\_description](#input\_cluster\_description) | Описание кластера | `string` | `"Zonal Kubernetes cluster"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Имя кластера Kubernetes | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID каталога в Yandex Cloud | `string` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Версия Kubernetes | `string` | `"1.27"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Окно обслуживания кластера | <pre>object({<br>    day        = optional(string)<br>    start_time = optional(string)<br>    duration   = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_master_public_ip"></a> [master\_public\_ip](#input\_master\_public\_ip) | Публичный IP для master-узла | `bool` | `true` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | ID сети | `string` | n/a | yes |
| <a name="input_network_policy_provider"></a> [network\_policy\_provider](#input\_network\_policy\_provider) | Провайдер сетевых политик | `string` | `"CALICO"` | no |
| <a name="input_node_groups"></a> [node\_groups](#input\_node\_groups) | Параметры групп узлов | <pre>map(object({<br>    name        = string<br>    description = optional(string, "Node group for zonal cluster")<br>    platform_id = optional(string, "standard-v2")<br>    memory      = optional(number, 8)<br>    cores       = optional(number, 4)<br>    disk_type   = optional(string, "network-hdd")<br>    disk_size   = optional(number, 64)<br>    nat         = optional(bool, false)<br>    scale_policy = object({<br>      fixed = optional(object({<br>        size = number<br>      }))<br>      auto = optional(object({<br>        min     = number<br>        max     = number<br>        initial = number<br>      }))<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_release_channel"></a> [release\_channel](#input\_release\_channel) | Канал обновлений | `string` | `"REGULAR"` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH публичный ключ | `string` | n/a | yes |
| <a name="input_ssh_username"></a> [ssh\_username](#input\_ssh\_username) | Имя пользователя для SSH доступа | `string` | `"ubuntu"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID подсети | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Зона доступности | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | CA сертификат кластера |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID кластера Kubernetes |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Имя кластера Kubernetes |
| <a name="output_cluster_sa_id"></a> [cluster\_sa\_id](#output\_cluster\_sa\_id) | ID сервисного аккаунта кластера |
| <a name="output_external_v4_endpoint"></a> [external\_v4\_endpoint](#output\_external\_v4\_endpoint) | Внешний endpoint кластера |
| <a name="output_node_sa_id"></a> [node\_sa\_id](#output\_node\_sa\_id) | ID сервисного аккаунта узлов |
<!-- END_TF_DOCS -->
