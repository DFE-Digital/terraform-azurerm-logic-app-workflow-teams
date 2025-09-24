# terraform-azurerm-logic-app-workflow-teams

[![Terraform CI](https://github.com/DFE-Digital/terraform-azurerm-logic-app-workflow-teams/actions/workflows/continuous-integration-terraform.yml/badge.svg?branch=main)](https://github.com/DFE-Digital/terraform-azurerm-logic-app-workflow-teams/actions/workflows/continuous-integration-terraform.yml?branch=main)
[![GitHub release](https://img.shields.io/github/release/DFE-Digital/terraform-azurerm-logic-app-workflow-teams.svg)](./releases)

This module creates and manages an Azure Logic App Workflow that can route alerts into Teams

## Usage

Example module usage:

```hcl
module "azurerm_logic_app_workflow_teams" {
  source  = "github.com/DFE-Digital/terraform-azurerm-logic-app-workflow-teams?ref=v0.0.1"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.13.3 |

## Providers

No providers.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
