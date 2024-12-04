plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "yandex" {
  enabled = true
  source  = "github.com/terraform-linters/tflint-ruleset-yandex"
  version = "0.4.1"
}
