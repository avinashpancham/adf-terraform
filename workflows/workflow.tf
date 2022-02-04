resource "azurerm_data_factory_pipeline" "test" {
  name                = "acctest"
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  variables = {
    "bob" = "item1"
  }
  activities_json = <<JSON
[
    {
        "name": "Append variable1",
        "type": "AppendVariable",
        "dependsOn": [],
        "userProperties": [],
        "typeProperties": {
            "variableName": "bob",
            "value": "something"
        }
    }
]
  JSON
}