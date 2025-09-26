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
            "text": ":warning: @{triggerBody()?['data']?['essentials']?['description']}"
          },
          %{ if message_tag != "" }
          {
            "type": "TextBlock",
            "text": "${message_tag}"
          },
          %{ endif }
          {
            "type": "TextBlock",
            "text": "*Hostname:* @{variables('alarmContext')['condition']['allOf'][0]['dimensions'][1]['value']}"
          },
          {
            "type": "TextBlock",
            "text": "A HTTP request was `@{variables('alarmContext')['condition']['allOf'][0]['dimensions'][0]['value']}` by ruleset `@{variables('alarmContext')['condition']['allOf'][0]['dimensions'][2]['value']}`. \n<@{variables('alarmContext')['condition']['allOf'][0]['linkToFilteredSearchResultsUI']}|Go to Log Analytics and run query>"
          }
        ]
      }
    }
  ]
}
