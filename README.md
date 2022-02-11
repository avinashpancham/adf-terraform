# Deploy an Azure Data Factory setup without git integration using Terraform
Azure Data Factory (ADF) is a popular orchestrator tool on Azure. Deploying workflows to ADF via [Git integration](https://docs.microsoft.com/en-us/azure/data-factory/continuous-integration-delivery) is recommended by Microsoft, but poses problems in a team setting as the complete Git repository is now tied to a single ADF resource. As a result I explored how multiple ADF resources could easily be deployed with Infrastructure as Code (such as Terraform) on a per request base. Terraform's [`azurerm`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) provider offers multiple ADF related resources to enable this, but at the time of writing I could not find a Terraform deployment example of ADF without git integration. Hence I decided to do it myself!

## Pipeline setup
The envisioned ADF pipeline consists of:
- Source: Azure PostgreSQL database with a `cars` table containing the [Cars93](https://forge.scilab.org/index.php/p/rdataset/source/tree/master/csv/MASS/Cars93.csv) csv file.
- Activity: `Copy Data` task from Azure PostgreSQL table to Azure Data Lake gen2
- Sink: 
    1. Azure Data Lake gen2 with `cars.parquet` file containing the Cars93 dataset
    2. Azure Data Lake gen2 with `cars.csv` file containing the Cars93 dataset

## Azure setup
The Terraform code to deploy resources on Azure is spread over three directories `bootstrap`, `infra` and `workflows`.
- `bootstrap`: contains shared resources such as resource groups, Azure Key Vault, Azure PostgreSQL database and Azure Data Lake gen2.
- `infra`: contains the ADF resource and a path on the Azure Data Lake. This directory enables multiple deployments of the same setup via `terraform workspaces`.
- `workflows`: contains the ADF pipeline, linked-services and datasets. This directory also enables multiple deployments of the same setup via `terraform workspaces`.

By creating a separate `terraform workspace` for both the `infra` and `workflows` directory a new, independent ADF resource can be deployed.

## Background: ADF and deployments
ADF offers multiple approaches to deploy workflows:
- UI driven: deploy workflows via the Azure Portal in a *no code* manner. This approach lowers the threshold to develop workflows, but the workflows are not backed by a central source of truth (i.e. git) since everything is set up manually.
  
- [Git integration](https://docs.microsoft.com/en-us/azure/data-factory/continuous-integration-delivery): Microsoft's preferred approach by linking ADF to a git repository. Code is now stored in a central source, but the main disadvantage of this approach is that the complete repository is connected to a single ADF instance. Collaboration with multiple team members, such as on development environments, then becomes a bottleneck as developers are now sharing (or rather waiting for) a single ADF instance. Next to this, the promotion of code from your development environment is done in a semi-manual, opinionated way from Microsoft, that differs from how regular apps would be deployed.

- Infrastructure as Code: Fully codified and automated approach to deploy workflows. Code is stored in git and multiple ADF instances can be deployed from separate branches (which is advantageous on for example development environments). The disadvantage is that it requires more preparation work than the previous two options, as the *complete* setup should be codified. At the moment I could only find examples of such setups using ARM templates.
  