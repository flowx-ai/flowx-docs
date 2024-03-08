---
sidebar_position: 3
---

# Integration management

Integration management helps you configure integrations between the following components: [**FLOWX.AI Engine**](../../../../terms/flowxai-process-engine), [**plugins**](../../../../terms/flowx-plugins), or different adapters. The only requirement is that they should connect to [Kafka](../../../../platform-overview/frameworks-and-standards/event-driven-architecture-frameworks/intro-to-kafka-concepts.md) to communicate with the [FLOWX.AI Engine](../../flowx-engine/).

Integration management enables you to keep track of each integration and its correspondent component and different scenarios used: creating an OTP, document generation, notifications, etc.

[Integrations](../../../integrations/integrations.md)

:::warning
Integrations must be compatible with [**Kafka**](../../../../terms/flowx-kafka), so they can communicate with external adapters and [**FLOWX.AI Engine**](../../../../terms/flowxai-process-engine). Communication is done through Kafka topics (handled by consumers and producers, see [Kafka configuration](../../../../platform-setup-guides/flowx-engine-setup-guide/flowx-engine-setup-guide.md#configuring-kafka) section for more details).
:::

After defining one integration (inside **Integration management**) you can open a compatible node and start using them.

:::info
Integrations are used with the following nodes: [task nodes](../../../../building-blocks/node/task-node.md), [user task nodes](../../../../building-blocks/node/user-task-node.md), [send message task](../../../../building-blocks/node/message-send-received-task-node.md#message-send-task), and [receive message task](../../../../building-blocks/node/message-send-received-task-node.md#message-receive-task).
:::

You can easily create or import an integration using the **Integration management** feature just by accessing **FLOWX Designer → Integration management**.

![Integration management](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/integrations.png)

## Accessing Integration management

To access Integration management:

1. Open **FLOWX Designer** and go to the **General Settings** tab.
2. From the expanded menu, select **Integration management**.
3. From the list, select an **Integration**.
4. Click the **arrow** icon to expand the list with the scenarios.

![Integration management](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/accessing_integration_mngmnt.gif)

### Configuring Access Rights for Integrations Management

For more details on how to configure access rights for Integrations Management, check the following section:

[Configuring access rights for Integration Management](configuring-access-rights-for-intgr-mngmnt.md)


## Creating a new integration

To create a new integration, see the steps described in [Accessing Integration management](./#accessing-integration-management), then follow the next steps:

1. Click **New integration** and fill in the details:
   * **Name** - the name of the integration
   * (Optional) **System name** - used for multiple source systems, if multiple enumerations values are needed to communicate with other systems
2. Click **Add**.

<div class="image-scaled">

![Add new integration](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/%20add_new_integration.png)

</div>

### Adding new scenarios

After you added a new integration, you can configure scenarios by following the next steps:

1. Open the newly created **integration**.
2. Click the **arrow** icon to expand the **drop-down list** with scenarios.
3. Click **+ Add new scenario** button and fill in the **name** of the scenario.


![Add new scenario](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/add_new_scenario.png)

### Configuring scenarios

You have multiple scenarios that you can configure on an integration. For example, for integration with the [notification plugin](../../../plugins/custom-plugins/notifications-plugin/notifications-plugin.md), you can configure the following scenarios: generate email notification, generate email OTP, generate push notifications, etc.

After you created a scenario you can configure the **data model** for it by following the next steps:

1. Select a **scenario** then click the **eye icon** to open the configuration.
2. You have two tabs **Send** and **Receive**, corresponding to the type of the actions: [Kafka Send](../../../../building-blocks/node/message-send-received-task-node.md#message-send-task) and [Kafka Receive](../../../../building-blocks/node/message-send-received-task-node.md#message-receive-task).
3. You have multiple **properties** that you need to configure:

* **Send** scenario:
  * [**Topics** ](#configuring-topics-for-send-scenario)
  * [**Message data model**](#configuring-message-data-model)
  * [**Headers**](#headers)

* **Receive** scenario:

  * [**Topics** ](#configuring-topics-for-receive-scenario)
  * [**Message data model**](#configuring-message-data-model)


### Topics

#### Configuring topics for Send scenario

Topics are defined depending on the environment where you want to use them. You need to configure the following details:

* **Input (in)** - the information that the FLOWX.AI Engine is reading, coming from the plugin or from the adapter
* **Environment** - the environment where the topic should be used (if you leave this field empty, all the environments will be selected)

<div class="image-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/add_send_topics.png)

</div>

#### Configuring topics for Receive scenario

* **Input (out)** - the information that the FLOWX.AI Engine is reading, coming from the plugin or from the adapter
* **Environment** - the environment where the topic should be used (if you leave this field empty, all the environments will be selected)

### Configuring message data model

**SEND scenario**: The message data model represents the content of the message that the adapters or plugins send to the FLOWX.AI Engine.

**RECEIVE scenario**: The output data model represents the content of the message that FLOWX.AI Engine sends to the adapters or plugins.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/send_message_dat_model.png)

To configure a new message data model, follow the next steps:

1. Open FLOWX.AI Admin.
2. From the left-side menu, select **Integration Management**.
3. Select an **integration**.
4. Select the type of the scenario then click "**+**" button.

The following details need to be configured:

* **Property name** - the name of the property types:
  * STRING
  * NUMBER
  * BOOLEAN
  * OBJECT - you can add multiple values types inside an OBJECT
![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/intgr_object.png) 
  * OBJECT_REF - used for values that are already defined in the process
  * ARRAY - for arrays you must specify the **Item type**
![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/input_model_item_type.png)
  * ARRAY_REF - used for values that are already defined in the process
  * ENUM - a special data type that enables for a variable to be a set of predefined constants

* **Description** - description of the input
* **Example value** - example value based on the type of the input
* **Mandatory** - could be mandatory or not

<div class="image-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/input_properties_attributes.png)

</div>


### Headers

All integrations have `processInstanceId` as a default header parameter.

:::info
If you have actions that contain [callbacks](../../../../building-blocks/actions/actions.md#callbacks-actions), multiple headers can be added, like the action name or the name of the node.
:::

Headers may also contain Kafka authorization (token in the header).

## Using integrations

As mentioned earlier, you can use integrations management to configure integrations between FLOWX.AI Engine and different plugins and adapters. These configurations are defined so that when you create a process (and it is using Kafka-related activities) you will no longer have to manually search for suitable topics or environments.&#x20;

Use predefined integrations, that you have already configured, on different processes and nodes. Places where integrations will be used:

* Node → Actions → **Kafka Send Action** (to send data to the integration)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/using_integrations.gif)

* Node → Node config → **Data stream topics** (the topic name where the [process engine](../../flowx-engine/) listens for the response)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/integrations_node_config.png)

:::info
Data stream topics are used to select the integration and the key on which the response is saved.
:::

If your integration has scenarios that are already used in another process, you will always be notified.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/integrations_in_use.png)