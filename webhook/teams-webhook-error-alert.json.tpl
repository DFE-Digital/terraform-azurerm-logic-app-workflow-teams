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
            "wrap": true,
            "text": "@{triggerBody()?['data']?['essentials']?['alertRule']}: @{triggerBody()?['data']?['essentials']?['monitorCondition']}"
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
            "text": "*Alert Rule:* @{triggerBody()?['data']?['essentials']?['alertRule']} \n*Description:* @{triggerBody()?['data']?['essentials']?['description']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "*<@{variables('alarmContext')['condition']['allOf'][0]['dimensions'][0]['value']}|@{variables('alarmContext')['condition']['allOf'][0]['dimensions'][3]['value']}>* \n @{variables('alarmContext')['condition']['allOf'][0]['dimensions'][1]['value']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "*Request:* @{variables('alarmContext')['condition']['allOf'][0]['dimensions'][6]['value']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "*Operation ID:* @{variables('alarmContext')['condition']['allOf'][0]['dimensions'][2]['value']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "*Status code:* @{variables('alarmContext')['condition']['allOf'][0]['dimensions'][4]['value']}"
          },
          {
            "type": "TextBlock",
            "wrap": true,
            "text": "*Log level:* @{variables('alarmContext')['condition']['allOf'][0]['dimensions'][5]['value']}"
          }
        ]
      }
    }
  ]
}
