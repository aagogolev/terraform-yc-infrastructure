# Terraform Yandex Cloud Infrastructure

Этот репозиторий содержит Terraform конфигурацию для развертывания базовой инфраструктуры в Yandex Cloud.

## Возможности

- Создание сетевой инфраструктуры (VPC, подсети)
- Развертывание виртуальных машин
- Настройка бастион хоста для безопасного доступа
- Управление приватными инстансами

## Структура проекта

```sh
.
├── environments
│   ├── compute
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars.example
│   │   └── variables.tf
│   ├── k8s-zonal
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars.example
│   │   └── variables.tf
│   ├── network
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars.example
│   │   └── variables.tf
├── modules
│   ├── compute
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── kubernetes
│   │   ├── regional
│   │   └── zonal
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       ├── variables.tf
│   │       └── versions.tf
│   ├── network
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
├── README.md
```

## Быстрый старт

1. Клонируйте репозиторий
2. cd environments/`"resource"`
2. Настройте переменные `cp terraform.tfvars.example terraform.tfvars`
3. Выполните:

```bash
terraform init
terraform plan
terraform apply
```

## Требования
Terraform >= 0.13
Настроенный доступ к Yandex Cloud
SSH ключи для доступа к инстансам
