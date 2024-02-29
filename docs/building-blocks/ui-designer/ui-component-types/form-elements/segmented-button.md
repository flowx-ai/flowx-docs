---
sidebar_position: 8
---

# Segmented button

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/segmented_button1.gif)

It allows users to pick only one option from a group of options, and you can choose to have between 2 and 5 options in the group. The segmented button is easy to use, and can help make your application easier for people to use.

## Configuring the segmented button

### Segmented button settings

The available configuration options for this form element are:

- [**General**](#general)
- [**Properties**](#properties)
- [**Datasource**](#datasource)
- [**Validators**](#validators)
- [**Expressions**](#expressions)
- [**UI actions**](#ui-actions)
- [**Segmented button styling**](#segmented-button-styling)

#### General
   
* **Process data key** - creates the binding between form element and process data so it can be later used in [decisions](../../../node/exclusive-gateway-node.md), [business rules](../../../actions/business-rule-action/business-rule-action.md) or [integrations](../../../node/message-send-received-task-node.md)

#### Properties

* **Label** - the label of the segmented button
* **Helpertext** - additional information about the segmented button (can be hidden inside an infopoint)

#### Datasource

* **Default Value** - the default value of the segmented button (it can be selected from one of the static source values)
* **Source Type** - it is by default Static
* **Add option** - value/label pairs can be defined here

#### Validators

The following validators can be added to a segmented button: `required` and `custom` (more details [here](../../validators.md)).

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/segmented_button_props.png)


#### UI actions

UI actions can be added to the segmented button element to define its behavior and interactions.

* **Event** - possible value: CHANGE
* **Action Type** - select the action type

:::info
For more details on how to configure a UI action, click [**here**](../../ui-actions.md).
:::

### Segmented button styling

To create a segmented button with specific styling, sizing, typography, and color settings, you can use the following configuration:

* [Sizing](#sizing)
* [Typography](#typography)
* [Background](#background)

#### Sizing

* set the width of the button - fill/fixed/auto

#### Typography

Choose an appropriate font family, size, and weight for the button label text.

* **Label Color** - set the color of the button label text
* **Selected State** - set the color of the label text when the button is selected
* **Unselected State** - set the color of the label text when the button is not selected

#### Background

* **Selected state** - set the background color of the button
* **Unselected state** - set the background color of the button

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/segmented_button_styling.png)

:::info
For more valid CSS properties, click [**here**](../../#styling).
:::
