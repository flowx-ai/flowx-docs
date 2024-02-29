---
sidebar_position: 2
---

# Text area

![Text area](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/text_area.png)

A text area is a form element used to capture multi-line input from users in a conversational interface. The text area component is typically used for longer inputs such as descriptions, comments, or feedback, providing users with more space to type their responses. 

It is an important tool for creating intuitive and effective conversational interfaces that can collect and process large amounts of user input.

## Configuring the text area element

### Text area settings

The text area offers the following configuration options:

- [**General**](#general)
- [**Properties**](#properties)
- [**Datasource**](#datasource)
- [**Validators**](#validators)
- [**Expressions**](#expressions)
- [**UI actions**](#ui-actions)
- [**Text area styling**](#text-area-styling)

#### General
   
* **Process data key** - creates the binding between form element and process data, so it can be later used in [decisions](../../../node/exclusive-gateway-node.md), [business rules](../../../actions/) or [integrations](../../../node/message-send-received-task-node.md#from-integration)

#### Properties

* **Label** - the label of the text area
* **Placeholder** - the placeholder text that appears in the text area
* **Has clear** - content clear property
* **Helpertext** - additional information about the text area field (can be hidden inside an infopoint)

#### Datasource

The default value for the element can be configured here, this will autofill the text field when you will run the process.

#### Validators

There are multiple validators can be added to a text area element (more details [here](../../validators.md)).

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/text_area_props.png)

#### Expressions  

The text area's behavior can be defined using JavaScript expressions for hiding or disabling the element. The following properties can be configured for expressions:
   
* **Hide** - JavaScript expression used to hide the text area when it returns a truthy value
* **Disabled** - JavaScript expression used to disable the text area when it returns a truthy value

:::info
It's important to make sure that disabled fields have the same expression configured under the path expressions → hide.
:::

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/text_area_props2.png)

#### UI actions

UI actions can be added to the text area field to define its behavior and interactions.

* **Event** - possible value: `CHANGE`
* **Action Type** - select the action type

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/text_area_props1.png)

:::info
For more details on how to configure a UI action, click [**here**](../../ui-actions).
:::

### Text area styling

The ability to style the text area element using CSS properties is relevant because it allows you to customize the appearance of the text area to match the overall design of the website or application.

[UI Designer styling](../../#styling)


