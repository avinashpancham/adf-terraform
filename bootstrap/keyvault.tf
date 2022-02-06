resource "random_password" "username" {
  length  = 16
  special = false
}

resource "random_password" "password" {
  length  = 16
  special = true
}

resource "azurerm_key_vault" "kv" {
  name                       = local.kv_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get", "List", "Purge", "Set", "Delete"
    ]

  }
}

resource "azurerm_key_vault_secret" "username" {
  name         = "db-user"
  value        = random_password.username.result
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "password" {
  name         = "db-password"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.kv.id
}