# Terraform Yandex Cloud Infrastructure

Этот репозиторий содержит Terraform конфигурацию для развертывания базовой инфраструктуры в Yandex Cloud.

## Возможности

- Создание сетевой инфраструктуры (VPC, подсети)
- Развертывание виртуальных машин
- Настройка бастион хоста для безопасного доступа
- Управление приватными инстансами

## Структура проекта

```sh
├── environments
│   ├── dev
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   ├── variables.tf
│   │   └── versions.tf
│   └── stage
├── modules
│   ├── compute
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── databases
│   ├── kubernetes
│   ├── network
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   └── storage
└── README.md
```

## Быстрый старт

1. Клонируйте репозиторий
2. Настройте переменные в `environments/prod/terraform.tfvars`
3. Выполните:

```bash
cd environments/prod
terraform init
terraform plan
terraform apply
```

## Требования
Terraform >= 0.13
Настроенный доступ к Yandex Cloud
SSH ключи для доступа к инстансам