# Indicators

The indicators (Message UI elements) allow you to display different types of messages.

Messages can be categorized into the following types:

* **Info**: Used to convey general information to users.
* **Warning**: Indicates potential issues or important notices.
* **Error**: Highlights errors or critical issues.
* **Success**: Communicates successful operations or completion.


![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/indicators_gen.png)

## Properties

When configuring a message, you have the following properties:

- **Message**: The content of the message body, this property supports markdown attributes such as: bold, italic, bold italic, strikethrough and URLs, allowing you to format the content of the message. 
- **Type**: as mentioned above, there are multiple indicators: info, warning, error, success
- **Expressions**: you can define expressions to control when the message should be hidden. This can be useful for dynamically showing or hiding messages based on specific conditions.


![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/indicators_prop.png)


Info example with markdown:

```markdown
If you are encountering any difficulties, please [contact our support team](mailto:support@flowx.ai).
```

When executed, will look like this:

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/indicators1.png)

## Types and Usage

Here's how you can use the Message UI element in your UI design:

### Info

If you are encountering any difficulties, please [contact our support team](mailto:support@flowx.ai).

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/info_indicator.png)


### Error

An error occurred while processing your request. Please try again later.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/indicator_error.png)


### Success

Your payment was successfully processed. Thank you for using our services!

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/indicator_success.png)

## Indicators styling


To create an indicator with specific styling, sizing, typography, and color settings, you can use the following configuration:

### Style

The Style section allows you to customize the appearance of your indicator UI element. You can apply the following style to achieve the desired visual effect:

- **Text**: Displays only the icon and the text.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/indicator_text.png)

- **Border**: Displays the icon, the text and the border.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/indicator_border.png)

- **Fill**: It will fill the UI element's area.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/indicator_fill.png)

:::info
For more valid CSS properties, click [**here**](../../ui-designer/ui-designer.md#styling).
:::




