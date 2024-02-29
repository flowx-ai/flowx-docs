---
sidebar_position: 3
---

# Upload File action

:::info
**What is it?** An **Upload File action** is an [**action**](../../terms/flowx-actions) type that allows you to upload a file to a service available on [**Kafka**](../../terms/flowx-kafka).

**Why is it useful?** The action will receive a file from the frontend and send it to Kafka, and will also attach some metadata.
:::

### Configuring an Upload File action

Multiple options are available for this type of action and can be configured via the [**FLOWX Designer**](../../terms/flowx-ai-designer). To configure an Upload File action, use the **Actions** tab at the [task node level](../../flowx-designer/managing-a-process-flow/adding-an-action-to-a-node.md), which has the following configuration options:

* [Action Edit](#action-edit)
* [Back in steps (for Manual actions)](#back-in-steps)
* [Parameters](#parameters)
* [Data to send (for Manual actions)](#data-to-send)

#### Action Edit

* **Name** - used internally to make a distinction between different actions on nodes in the process. We recommend defining an action naming standard to be able to quickly find the process actions
* **Order** - if multiple actions are defined on the same node, the running order should be set using this option
* **Timer expression** - it can be used if a delay is required on that action. The format used for this is [ISO 8601 duration format ](https://www.w3.org/TR/NOTE-datetime)(for example, a delay of 30 seconds will be set up as `PT30S`)
* **Action type** - should be set to **Upload File**
* **Trigger type** (options are Automatic/Manual) - choose if this action should be triggered automatically (when the process flow reaches this step) or manually (triggered by the user); in most use cases, this will be set to automatic
* **Required type** (options are Mandatory/Optional) - automatic actions can only be defined as mandatory. Manual actions can be defined as mandatory or optional.
* **Repeatable** - should be checked if the action can be triggered multiple times
* **Autorun Children** - when this is switched on, the child actions (the ones defined as mandatory and automatic) will run immediately after the execution of the parent action is finalized

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/node/upload_file_action_edit.png)

#### **Back in steps**

* **Allow BACK on this action** - back in process is a functionality that allows you to go back in a business process and redo a series of previous actions in the process. For more details, check [Moving a token backwards in a process](../../flowx-designer/managing-a-process-flow/moving-a-token-backwards-in-a-process.md) section.

#### Parameters

* **Address** - the Kafka topic where the file will be posted
* **Document Type** - other metadata that can be set (useful for the [document plugin](../../platform-deep-dive/plugins/custom-plugins/documents-plugin/documents-plugin.md))
* **Folder** - allows you to configure a value by which the file will be identified in the future
* **Advanced configuration (Show headers)** - this represents a JSON value that will be sent on the headers of the Kafka message

#### Data to send

* **Keys** - are used when data is sent from the frontend via an action to validate the data (you can find more information in the [User Task configuration](../node/user-task-node.md) section)

:::warning
**Data to send** option is configurable only when the action **trigger type** is **Manual**.
:::

### Example

An example of **Upload File Action** is to send a file to the [document plugin](../../platform-deep-dive/plugins/custom-plugins/documents-plugin/documents-plugin.md). In this case, the configuration will look like this:

**Parameters configuration**

* **Address (topicName)** - will be set to (the id of the document plugin service) `ai.flowx.in.document.persist.v1`
* **Document Type** - metadata used by the document plugin, here we will set it to`BULK`
* **Folder** - the value by which we want to identify this file in the future (here we use the **client.id** value available on the process instance data: `${application.client.id}`

**Advanced configuration**

* **Headers** - headers will send extra metadata to this topic -`{"processInstanceId": ${processInstanceId}, "destinationId": "curentNodeName"}`)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/node/upload_file_action_params.png)


