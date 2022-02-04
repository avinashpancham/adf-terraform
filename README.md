# Azure Data Factory in Terraform

Azure Data Factory (ADF) is a popular ETL on Azure. Its offers multiple approaches to deploy workflows:
- UI driven: lowers the threshold to develop workflows, but does not store code in a central source of truth (i.e. git)
- [Git integration](https://docs.microsoft.com/en-us/azure/data-factory/continuous-integration-delivery): Microsoft's preferred approach by linking to a git repository. This offers some advantages compared to the UI driven approach, but it is still semi-manual
- ARM template: Fully automated approach to deploy workflows. The disadvantage (according to me) that ARM templates are large JSON files that are not convenient to work with
  
My personal preference is to automate the deployment of ADF workflows with Terraform. The [`azurerm`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) provider offers multiple resources to enable this. At the time of writing examples of this are, however, still lacking. Therefore I decided to explore this on my own. 
