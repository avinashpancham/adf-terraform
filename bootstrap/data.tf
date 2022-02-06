data "azurerm_client_config" "current" {}

data "http" "personal_ip" {
  url = "https://ifconfig.co/json"
  request_headers = {
    Accept = "application/json"
  }
}