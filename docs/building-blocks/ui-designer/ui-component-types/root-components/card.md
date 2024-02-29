---
sidebar_position: 2
---

# Card

A card in Flowx is a graphical component designed for the purpose of grouping and aligning various elements. It offers added functionality by incorporating an accordion feature, allowing users to expand and collapse content as needed.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/card_element1.gif)

The following properties that can be configured:

### Properties and Settings

#### Settings

##### When Used as Root

When utilized as the root component, the card provides the following settings:

* **Message**: A valid JSON describing the data transmitted to the frontend when the process reaches a specific user task.
* **Title**: The title of the card.
* **Subtitle**: A subtitle accompanying the card.
* **Card style**: Choose between a border or raised style for the card.
* **Has accordion**: This feature introduces a Bootstrap accordion, facilitating the organization of content within collapsible items. It ensures that only one collapsed item is displayed at a time.



:::caution
Starting from platform version **3.4.7**, the "Message" property for cards has been replaced with "Custom UI Payload." In User Tasks containing UI Elements, the Backend (BE) automatically dispatches all relevant data as process variables to the Frontend (FE) by default. Explicitly mentioning data to be pushed is no longer required.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/card_custom_ui.png)
:::

##### When Not Used as Root

When the card is not the root, you can configure: **Title**, **Subtitle**, **Card Style** and **Has Accordion**.

:::caution
The accordion element is not available for mobile devices.
:::

<div className= "image-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_designer_settings.png)

</div>

By leveraging cards in your design, you can seamlessly organize and present content, enhancing the overall user experience.

### Styling

* **Layout** - This property is available for components that group children and includes the following options:

    * Direction - Horizontal / Vertical (for example, select *Vertical*)
    * Justify (H) - (for example, select *center*)
    * Align (V) - this option allows you to align components vertically
    * Gap - you can set the gap between components

More layout demos available below:

[Layout Demos](https://tburleson-layouts-demos.firebaseapp.com/#/docs)

This example will generate a card with the following layout configuration:

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/card_layout.png)

For more information about styling and layout configuration, check the following section:

[UI Designer](../../ui-designer.md#styling)

### Validating elements

To validate all form elements under a card, you need to set the key of the form/element on the property of the button: _Forms To Validate._

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/card_validate.png)