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
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.51.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_logic_app_action_custom.condition_check_for_waf](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_action_custom) | resource |
| [azurerm_logic_app_action_custom.var](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_action_custom) | resource |
| [azurerm_logic_app_trigger_http_request.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_trigger_http_request) | resource |
| [azurerm_logic_app_workflow.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_workflow) | resource |
| [azurerm_management_lock.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_monitor_diagnostic_setting.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_resource_group.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_log_analytics_workspace.existing_log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_resource_group.existing_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_location"></a> [azure\_location](#input\_azure\_location) | Azure location in which to launch resources. | `string` | n/a | yes |
| <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting) | Enable Diagnostics for the Logic App Workflow and send data to Log Analytics | `bool` | `true` | no |
| <a name="input_enable_resource_group_lock"></a> [enable\_resource\_group\_lock](#input\_enable\_resource\_group\_lock) | Enabling this will add a Resource Lock to the Resource Group preventing any resources from being deleted. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name. Will be used along with `project_name` as a prefix for all resources. | `string` | n/a | yes |
| <a name="input_existing_log_analytics_workspace"></a> [existing\_log\_analytics\_workspace](#input\_existing\_log\_analytics\_workspace) | Conditionally send Diagnostics into an existing Log Analytics Workspace. Specifying this will NOT create a new resource | `string` | `""` | no |
| <a name="input_existing_resource_group"></a> [existing\_resource\_group](#input\_existing\_resource\_group) | Conditionally launch resources into an existing resource group. Specifying this will NOT create a resource group. | `string` | `""` | no |
| <a name="input_log_analytics_retention_period_days"></a> [log\_analytics\_retention\_period\_days](#input\_log\_analytics\_retention\_period\_days) | Retention period for logs in the Log Analyitcs Workspace. Has no effect if you are using an existing workspace | `number` | `30` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name. Will be used along with `environment` as a prefix for all resources. | `string` | n/a | yes |
| <a name="input_resource_group_target_webhooks"></a> [resource\_group\_target\_webhooks](#input\_resource\_group\_target\_webhooks) | Teams webhook destinations keyed by the Resource Group you want to collect webhooks from.<br/>  Include an optional override for sev1 alarms by populating 'sev1\_webhook\_url'.<br/>  If 'message\_tag' is populated, it will be included as the first message line in Teams. You can use this for tagging users | <pre>map(<br/>    object({<br/>      webhook_url       = string<br/>      message_tag       = optional(string, "<!here>")<br/>      error_webhook_url = optional(string, "")<br/>      error_message_tag = optional(string, "<!here>")<br/>      sev1_webhook_url  = optional(string, "")<br/>      sev1_message_tag  = optional(string, "<!channel>")<br/>    })<br/>  )</pre> | `{}` | no |
| <a name="input_route_waf_logs"></a> [route\_waf\_logs](#input\_route\_waf\_logs) | Do you want to route WAF Logs to a separate Teams channel? | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_waf_logs_webhook_url"></a> [waf\_logs\_webhook\_url](#input\_waf\_logs\_webhook\_url) | Teams webhook URL for WAF Logs | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_log_analytics_workspace"></a> [azurerm\_log\_analytics\_workspace](#output\_azurerm\_log\_analytics\_workspace) | Log Analytics Workspace linked to the Logic App Workflow |
| <a name="output_logic_app_workflow"></a> [logic\_app\_workflow](#output\_logic\_app\_workflow) | Logic App Workflow |
| <a name="output_logic_app_workflow_trigger"></a> [logic\_app\_workflow\_trigger](#output\_logic\_app\_workflow\_trigger) | Logic App Workflow Trigger |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | The Resource Group the Logic App was deployed to |
<!-- END_TF_DOCS -->
