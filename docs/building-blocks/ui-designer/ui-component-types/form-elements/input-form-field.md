---
sidebar_position: 1
---

# Input

![Input](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/input_form_field.png)

An input field is a form element that enables users to input data with validations and can be hidden or disabled.

## Configuring the input element

### Input settings

The Input Field offers the following configuration options:

- [**General**](#general)
- [**Properties**](#properties)
- [**Datasource**](#datasource)
- [**Validators**](#validators)
- [**Expressions**](#expressions)
- [**UI actions**](#ui-actions)
- [**Input styling**](#input-styling)

#### General
   
* **Process data key** - creates the binding between form element and process data, so it can be later used in [decisions](../../../node/exclusive-gateway-node.md), [business rules](../../../actions/business-rule-action/business-rule-action.md) or [integrations](../../../node/message-send-received-task-node.md#from-integration)

#### Properties

* **Label** - the label that appears on the input field
* **Placeholder** - the placeholder text that appears in the input field when it is empty
* **Type** - the type of data that the input field can accept, such as text, number, email, or password
* **Prefix** - a label that appears as a prefix to the input field
* **Suffix** - a label that appears as a suffix to the input field
* **Has clear** - 
* **Helpertext** - additional information about the input field (can be hidden inside an infopoint)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/input_props.png)

#### Datasource

The default value for the element can be configured here, this will autofill the input field when you will run the process.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/input_datasource1.png)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/input_datasource.png)

##### Computed datasource value

To add a computed value, you have to explicitly check “Computed value” option (represented by the `f(x)` icon), which will transform the desired field into a JavaScript editor.

Check the following example:

[Computed values](../../dynamic-and-computed-values.md#computed-values)

#### Validators

There are multiple validators can be added to an input (more details [here](../../validators.md)).

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/input_validators.png)

#### Expressions  

The input field's behavior can be defined using JavaScript expressions for hiding or disabling the element. The following properties can be configured for expressions:
   
* **Hide** - JavaScript expression used to hide the Input Field when it returns a truthy value
* **Disabled** - JavaScript expression used to disable the Input Field when it returns a truthy value

:::info
It's important to make sure that disabled fields have the same expression configured under the path expressions → hide.
:::

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/input_expressions.png)

#### UI actions

UI actions can be added to the Input Field to define its behavior and interactions.

* **Event** - possible value: `CHANGE`
* **Action Type** - select the action type

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/input_ui_actions.gif)

:::info
For more details on how to configure a UI action, click [**here**](../../ui-actions).
:::

### Input styling

#### Icons

* **Icon Key** - the key associated in the Media library, select the icon from the **Media Library**
* **Icon Color** - select the color of the icon using the color picker 

:::info
When setting the color, the entire icon is filled with that color, the SVG's fill. Avoid changing colors for multicolor icons.
:::

You have the option to enhance the Input element by incorporating two types of icons:

* **Left Icon**: You can include an icon on the left side of the Input element. This icon can serve as a visual cue or symbol associated with the input field's purpose or content.
* **Right Icon**: Same as left icon.

By utilizing these two types of icons, you can provide users with a more intuitive and visually appealing experience when interacting with the Input element.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/input_icons.png)

#### Typography

You can customize the typography for the following properties:

* Label
* Text
* Helper & errors

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/input_typography.png)

For more details on how to upload and manage fonts, check the following section:

[Font management](../../../../platform-deep-dive/core-components/core-extensions/content-management/font-files.md)

The Input Field can be styled using valid CSS properties (more details [here](../../#styling))

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/input_form_field_styling.gif)
