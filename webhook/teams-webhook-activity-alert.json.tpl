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
            "style": "accent",
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
            "text": "**Alert Rule:** @{triggerBody()?['data']?['essentials']?['alertRule']} \n*Description:* @{triggerBody()?['data']?['essentials']?['description']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "**Resource:** \n [@{triggerBody()?['data']?['essentials']?['configurationItems']?[0]}](@{concat('https://portal.azure.com/#@', variables('tenantID'))}/resource@{triggerBody()?['data']?['essentials']?['alertTargetIDs']?[0]})"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "**Type:** \n @{triggerBody()?['data']?['essentials']?['targetResourceType']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "**Caller:** @{variables('alarmContext')['caller']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "**Operation:** \n@{variables('alarmContext')['operationName']} (@{variables('alarmContext')['status']})"
          }
        ]
      }
    }
  ]
}
