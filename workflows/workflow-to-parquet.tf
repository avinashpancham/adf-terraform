resource "azurerm_data_factory_pipeline" "copy-to-parquet" {
  name                = local.parquet_pipeline_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  activities_json     = <<JSON
[
            {
                "name": "Copy data",
                "type": "Copy",
                "dependsOn": [],
                "policy": {
                    "timeout": "7.00:00:00",
                    "retry": 0,
                    "retryIntervalInSeconds": 30,
                    "secureOutput": false,
                    "secureInput": false
                },
                "userProperties": [],
                "typeProperties": {
                    "source": {
                        "type": "PostgreSqlSource"
                    },
                    "sink": {
                        "type": "ParquetSink",
                        "storeSettings": {
                            "type": "AzureBlobFSWriteSettings"
                        },
                        "formatSettings": {
                            "type": "ParquetWriteSettings"
                        }
                    },
                    "enableStaging": false,
                    "translator": {
                        "type": "TabularTranslator",
                        "mappings": [
                            {
                                "source": {
                                    "name": "ID"
                                },
                                "sink": {
                                    "name": "ID"
                                }
                            },
                            {
                                "source": {
                                    "name": "Manufacturer"
                                },
                                "sink": {
                                    "name": "Manufacturer"
                                }
                            },
                            {
                                "source": {
                                    "name": "Model"
                                },
                                "sink": {
                                    "name": "Model"
                                }
                            },
                            {
                                "source": {
                                    "name": "Type"
                                },
                                "sink": {
                                    "name": "Type"
                                }
                            },
                            {
                                "source": {
                                    "name": "Min.Price"
                                },
                                "sink": {
                                    "name": "Min.Price"
                                }
                            },
                            {
                                "source": {
                                    "name": "Price"
                                },
                                "sink": {
                                    "name": "Price"
                                }
                            },
                            {
                                "source": {
                                    "name": "Max.Price"
                                },
                                "sink": {
                                    "name": "Max.Price"
                                }
                            },
                            {
                                "source": {
                                    "name": "MPG.city"
                                },
                                "sink": {
                                    "name": "MPG.city"
                                }
                            },
                            {
                                "source": {
                                    "name": "MPG.highway"
                                },
                                "sink": {
                                    "name": "MPG.highway"
                                }
                            },
                            {
                                "source": {
                                    "name": "AirBags"
                                },
                                "sink": {
                                    "name": "AirBags"
                                }
                            },
                            {
                                "source": {
                                    "name": "DriveTrain"
                                },
                                "sink": {
                                    "name": "DriveTrain"
                                }
                            },
                            {
                                "source": {
                                    "name": "Cylinders"
                                },
                                "sink": {
                                    "name": "Cylinders"
                                }
                            },
                            {
                                "source": {
                                    "name": "EngineSize"
                                },
                                "sink": {
                                    "name": "EngineSize"
                                }
                            },
                            {
                                "source": {
                                    "name": "Horsepower"
                                },
                                "sink": {
                                    "name": "Horsepower"
                                }
                            },
                            {
                                "source": {
                                    "name": "RPM"
                                },
                                "sink": {
                                    "name": "RPM"
                                }
                            },
                            {
                                "source": {
                                    "name": "Rev.per.mile"
                                },
                                "sink": {
                                    "name": "Rev.per.mile"
                                }
                            },
                            {
                                "source": {
                                    "name": "Man.trans.avail"
                                },
                                "sink": {
                                    "name": "Man.trans.avail"
                                }
                            },
                            {
                                "source": {
                                    "name": "Fuel.tank.capacity"
                                },
                                "sink": {
                                    "name": "Fuel.tank.capacity"
                                }
                            },
                            {
                                "source": {
                                    "name": "Passengers"
                                },
                                "sink": {
                                    "name": "Passengers"
                                }
                            },
                            {
                                "source": {
                                    "name": "Length"
                                },
                                "sink": {
                                    "name": "Length"
                                }
                            },
                            {
                                "source": {
                                    "name": "Wheelbase"
                                },
                                "sink": {
                                    "name": "Wheelbase"
                                }
                            },
                            {
                                "source": {
                                    "name": "Width"
                                },
                                "sink": {
                                    "name": "Width"
                                }
                            },
                            {
                                "source": {
                                    "name": "Turn.circle"
                                },
                                "sink": {
                                    "name": "Turn.circle"
                                }
                            },
                            {
                                "source": {
                                    "name": "Rear.seat.room"
                                },
                                "sink": {
                                    "name": "Rear.seat.room"
                                }
                            },
                            {
                                "source": {
                                    "name": "Luggage.room"
                                },
                                "sink": {
                                    "name": "Luggage.room"
                                }
                            },
                            {
                                "source": {
                                    "name": "Weight"
                                },
                                "sink": {
                                    "name": "Weight"
                                }
                            },
                            {
                                "source": {
                                    "name": "Origin"
                                },
                                "sink": {
                                    "name": "Origin"
                                }
                            },
                            {
                                "source": {
                                    "name": "Make"
                                },
                                "sink": {
                                    "name": "Make"
                                }
                            }
                        ]
                    }
                },
                "inputs": [
                    {
                        "referenceName": "${azurerm_data_factory_dataset_postgresql.source_table.name}",
                        "type": "DatasetReference"
                    }
                ],
                "outputs": [
                    {
                        "referenceName": "${azurerm_data_factory_dataset_parquet.sink_parquet.name}",
                        "type": "DatasetReference"
                    }
                ]
            }
        ]
 JSON
}