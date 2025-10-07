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
                "text": "**⚠️  @{triggerBody()?['data']?['essentials']?['description']}**",
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
            "text": "**Hostname:** @{variables('alarmContext')['condition']['allOf'][0]['dimensions'][1]['value']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "A HTTP request was `@{variables('alarmContext')['condition']['allOf'][0]['dimensions'][0]['value']}` by ruleset `@{variables('alarmContext')['condition']['allOf'][0]['dimensions'][2]['value']}`"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "[Go to Log Analytics and run query](@{variables('alarmContext')['condition']['allOf'][0]['linkToFilteredSearchResultsUI']})"
          }          
        ]
      }
    }
  ]
}
