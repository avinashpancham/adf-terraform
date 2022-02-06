resource "azurerm_postgresql_server" "source" {
  name                          = local.postgres_name
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  public_network_access_enabled = true

  administrator_login          = azurerm_key_vault_secret.username.value
  administrator_login_password = azurerm_key_vault_secret.password.value
  backup_retention_days        = 7
  sku_name                     = "B_Gen5_1"
  ssl_enforcement_enabled      = false
  storage_mb                   = 5120
  version                      = "11"
}

resource "azurerm_postgresql_database" "db" {
  name                = local.database_name
  resource_group_name = azurerm_resource_group.rg.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
  server_name         = azurerm_postgresql_server.source.name
}

resource "azurerm_postgresql_firewall_rule" "home" {
  name                = "home"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.source.name
  start_ip_address    = local.personal_ip.ip
  end_ip_address      = local.personal_ip.ip
}

// Allow access to managed ADF hosted instance
resource "azurerm_postgresql_firewall_rule" "azure" {
  name                = "azure"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.source.name

  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "null_resource" "fill-db" {
  depends_on = [azurerm_postgresql_database.db, azurerm_postgresql_firewall_rule.home]
  provisioner "local-exec" {
    command = "python scripts/fill_db.py postgresql://${azurerm_key_vault_secret.username.value}%40${azurerm_postgresql_server.source.name}:${urlencode(azurerm_key_vault_secret.password.value)}@${azurerm_postgresql_server.source.name}.postgres.database.azure.com:5432/${azurerm_postgresql_database.db.name}"
  }
}
