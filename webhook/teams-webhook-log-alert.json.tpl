{
  "type": "message",
  "attachments": [
    {
      "contentType": "application/vnd.microsoft.card.adaptive",
      "contentUrl": null,
      "content": {
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "type": "AdaptiveCard",
        "version": "1.2",
        "body": [
          {
            "type": "TextBlock",
            "text": "@{triggerBody()?['data']?['essentials']?['alertRule']}: @{triggerBody()?['data']?['essentials']?['monitorCondition']}"
          },
          %{ if message_tag != "" }
          {
            "type": "TextBlock",
            "text": "${message_tag}"
          },
          %{ endif }
          {
            "type": "TextBlock",
            "text": "*Alert Rule:* @{triggerBody()?['data']?['essentials']?['alertRule']} \n*Description:* @{triggerBody()?['data']?['essentials']?['description']}"
          },
          {
            "type": "TextBlock",
            "text": "*Resource:* \n <@{concat('https://portal.azure.com/#@', variables('tenantID'))}/resource@{triggerBody()?['data']?['essentials']?['alertTargetIDs']?[0]}|@{last(variables('affectedResource'))}>"
          },
          {
            "type": "TextBlock",
            "text": "*Severity:* \n @{variables('alarmSeverity')}"
          },
          {
            "type": "TextBlock",
            "text": "*Metric:* \n@{variables('alarmContext')['condition']['allOf'][0]['metricMeasureColumn']} @{variables('alarmContext')['condition']['allOf'][0]['timeAggregation']} @{variables('alarmContext')['condition']['allOf'][0]['operator']} @{variables('alarmContext')['condition']['allOf'][0]['threshold']}"
          },
          {
            "type": "TextBlock",
            "text": "*Recorded value:* \n@{variables('alarmContext')['condition']['allOf'][0]['metricValue']} \n <@{variables('alarmContext')['condition']['allOf'][0]['linkToFilteredSearchResultsUI']}|Go to Log Analytics and run query>"
          }
        ]
      }
    }
  ]
}
