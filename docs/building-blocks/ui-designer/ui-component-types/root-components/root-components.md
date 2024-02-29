---
sidebar_position: 1
---

# Root components

Root components, also known as layout elements, are used to group different types of components, each serving a specific purpose:


* [**Container**](container.md) - Used to group and configure the layout for multiple components of any type.
* [**Custom** ](custom.md) - Angular components developed in the container application and passed to the SDK at runtime, identified here by the component name.
* [**Card**](card.md) - Acts like a [**Container**](container.md) component; it also has the option to become an accordion.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/root_components.gif)

The root component can hold a hierarchical component structure as follows:

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/root_components_structure.png)

Available children for **Card** and **Container** are:

1. [**Form**](../form-elements/) - Used to group and align form field elements (inputs, radios, checkboxes, etc.).

:::info
For more information about the form elements, please refer to the[<u>**Form elements**</u>](../form-elements/form-elements.md) section.
:::

2. [**Image**](../image.md) - Allows you to configure an image in the document.
3. **Text** - A simple text can be configured via this component; basic configuration is available.
4. **Link** - Used to configure a hyperlink that opens in a new tab.
5. [**Button**](../buttons.md) - Multiple options are available for configuration, with the most important part being the possibility to add actions.
6. [**File Upload**](../buttons.md) - A specific type of button that allows you to select a file.
7. [**Custom**](custom.md) - Custom components.
8. [**Indicators**](../indicators.md) - Message UI elements to display different types of messages.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/card_elements.png)


