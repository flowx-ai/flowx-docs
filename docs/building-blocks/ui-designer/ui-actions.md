---
sidebar_position: 2
---

# UI actions

Multiple UI elements can be linked to an [action](../actions/actions.md) via a UI Action. If the action is just a method to interact with the process, the UI Action adds information about how that UI should react. For example, should a loader appear after executing the action, should a modal be dismissed, or if some default data should be sent back to the process.

UI actions create a link between an [**action**](../actions/actions.md) and a UI component or [**custom component**](./ui-component-types/root-components/custom.md). 

The UI action informs the UI element to execute the given action when triggered. Other options are available for configuration when setting an action to a button and are detailed below.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_actions.gif)

There are two main types of UI Actions:

- [Process UI Actions](#process-ui-actions)
- [External UI Actions](#external-ui-actions)

## Process UI actions

This is a UI action that describes how a [**Button**](../ui-designer/ui-component-types/buttons.md) (generated or custom) should interact with a process Manual action.

First, we need to configure the [manual action](../actions/actions.md) that will be referred from the UI Action. For more information on how to add an action to a node, and how to configure it, check the following section:

[Adding an action to a node](../../flowx-designer/managing-a-process-flow/adding-an-action-to-a-node.md)

### Manual action configuration example - Save Data

1. Add an **action** to a node.
2. Select the action type - for example **Save Data**.
3. The action **type** should be **manual**.
4. **Keys** - it has two important implications:
   * First, this is a prefix of the keys that will send back by the UI Action link to this action. For example, if we have a big form with a lot of elements, but we need an action that just sends the email back (maybe creating email validation functionality) we will add just the key of that field: `application.client.email`; if we need a button that will send back all the form elements that have keys that start with `application.client` we can add just this part
   * Second, a backend validation will be run to accept and persist just the data that start with this prefix. If we have three explicit keys, `application.client.email`, `application.client.phone`, `application.client.address` and we send `application.client.age`this key will not be persisted

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_action_key.png)

When this prerequisite is ready we can define the UI Action.

:::caution
UI Actions and [Actions](../actions/actions.md) should be configured on the same node.
:::

### UI action configuration example

Multiple configurations are available - **ACTION** type example:

* [**Event**](#events)
* [**Type**](#action-types)
* **Node Action Name** - dropdown with available actions for this node. If the dropdown is empty please add a manual action that is required before we create the UI Action
* **Use a different name for UI action**
* **UI action name** - **this becomes** important when the action is used in a [**Custom component**](./ui-component-types/root-components/custom.md) as it will be used to trigger the action. For UI actions added on a generated button component this name is just descriptive
* **Custom body** - this is the default response in JSON format that will be merged with any extra parameters added explicitly when executing the action, by a web application (from a [custom component](./ui-component-types/root-components/custom.md))
* **Forms to validate** - select from the dropdown what element will be validated (you can also select the children)
* **Dismiss process** - if the UI Actions is added on a subprocess and this parameter is true, triggering this UI action will dismiss the subprocess view (useful for modals subprocess)
* **Show loader?** - a loader will be displayed if this option is true until a web-socket event will be received (new screen or data)

<div className= "image-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_actions_multiple_configs.png)

</div>

## UI actions elements

### Events

You can add an event depending on the element that you select. There are two events types available: **CLICK** and **CHANGE**.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_action_events.gif)

:::info
:exclamation:Not available for _UI Actions_ on [Custom Components](./ui-component-types/root-components/custom.md).
:::

### Action types

The **action type** dropdown will be pre-filled with the following UI action types:

* DISMISS - used to dismiss a modal after action execution
* ACTION - used to link an action to a UI action
* START_PROCESS_INHERIT - used to inherit data from another process
* UPLOAD - used to create an un upload action
* [EXTERNAL](ui-actions.md#external-ui-actions) - used to create an action that will open a link in a new tab

## External UI actions

Used to create an action that will open a link in a new tab.

If we toggle the EXTERNAL type, a few new options are available:

1. **URL** - web URL that will be used for the external action
2. **Open in new tab** - this option will be available to decide if we want to run the action in the current tab or open a new one

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_action_external.png)

For more information on how to add actions and how to configure a UI, check the following section:

[Managing a process flow](../../flowx-designer/managing-a-process-flow/managing-a-process-flow.md)
