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
            "type": "Container",
            "style": "warning",
            "items": [
              {
                "type": "TextBlock",
                "wrap": true,
                "text": "**@{triggerBody()?['data']?['essentials']?['alertRule']}: @{triggerBody()?['data']?['essentials']?['monitorCondition']}**",
                "size": "large",
                "horizontalAlignment": "center"
              }
            ]
          },
          %{ if message_tag != "" }
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "${message_tag}"
          },
          %{ endif }
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "**Alert Rule:** @{triggerBody()?['data']?['essentials']?['alertRule']} \n**Description:** @{triggerBody()?['data']?['essentials']?['description']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "**Resource:** \n [@{last(variables('affectedResource'))}](@{concat('https://portal.azure.com/#@', variables('tenantID'))}/resource@{triggerBody()?['data']?['essentials']?['alertTargetIDs']?[0]})"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "**Severity:** \n @{variables('alarmSeverity')}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "**Metric:** \n@{variables('alarmContext')['condition']['allOf'][0]['metricMeasureColumn']} @{variables('alarmContext')['condition']['allOf'][0]['timeAggregation']} @{variables('alarmContext')['condition']['allOf'][0]['operator']} @{variables('alarmContext')['condition']['allOf'][0]['threshold']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "**Recorded value:** \n@{variables('alarmContext')['condition']['allOf'][0]['metricValue']} \n [Go to Log Analytics and run query](@{variables('alarmContext')['condition']['allOf'][0]['linkToFilteredSearchResultsUI']})"
          }
        ]
      }
    }
  ]
}
