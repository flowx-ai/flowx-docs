# Integrations

## What is an integration?

Integrations play a crucial role in **connecting legacy systems** or **third-party applications** to the [**FLOWX.AI Process engine**](../../terms/flowxai-process-engine). They enable seamless communication by leveraging custom code and the [**Kafka**](../../terms/flowx-kafka) messaging system.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/3.5/custom_intg.svg)

Integrations serve various purposes, including working with legacy APIs, implementing custom file exchange solutions, or integrating with RPAs.

#### High-level architecture 

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/intgr_final.png)

Integrations involve interaction with legacy systems and require custom development to integrate them into your FLOWX.AI setup.

## Developing a custom integration

Developing custom integrations for the [**FLOWX.AI platform**](../../terms/flowx) is a straightforward process. You can use your preferred technology to write the necessary custom code, with the requirement that it can send and receive messages from the [**Kafka**](../../terms/flowx-kafka) cluster.

#### Steps to create a custom integration

Follow these steps to create a custom integration:

1. Develop a microservice, referred to as a "Connector," using your preferred tech stack. The Connector should listen for Kafka events, process the received data, interact with legacy systems if required, and send the data back to Kafka.

2. Configure the [process definition](../../building-blocks/process/process-definition.md) by adding a [message](../../building-blocks/node/message-send-received-task-node.md) send action in one of the [nodes](../../building-blocks/node/node.md). This action sends the required data to the Connector.

3. Once the custom integration's response is ready, send it back to the FLOWX.AI engine. Keep in mind that the process will wait in a receive message node until the response is received.

For Java-based Connector microservices, you can use the following startup code as a quickstart guide:

[Quickstart connector](https://github.com/flowx-ai/quickstart-connector)

## Managing an integration

#### Managing Kafka topics

It's essential to configure the engine to consume events from topics that follow a predefined naming pattern. The naming pattern is defined using a topic prefix and suffix, such as "*ai.flowx.dev.engine.receive*."

:::info
The suggested naming convention is as follows:

```yaml
 topic:
    naming:
      package: "ai.flowx."
      environment: "dev."
      version: ".v1"
      prefix: ${kafka.topic.naming.package}${kafka.topic.naming.environment}
      suffix: ${kafka.topic.naming.version}
      engineReceivePattern: engine.receive

    pattern: ${kafka.topic.naming.prefix}${kafka.topic.naming.engineReceivePattern}*
```
:::
