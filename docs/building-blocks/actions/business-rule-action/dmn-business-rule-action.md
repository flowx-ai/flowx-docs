# Configuring a DMN Business Rule Action

If you're new to the concept of [**Decision Model and Notation (DMN)**](../../../terms/dmn), you can get started with a brief overview in the [Intro to DMN](../../../platform-overview/frameworks-and-standards/business-process-industry-standards/intro-to-dmn.md) section.


### Creating a DMN Business Rule action

To create and link a DMN [**business rule**](../../../terms/business-rules) action to a task [**node**](../../../terms/flowx-node) in FLOWX, follow these steps:

1. Launch [**FLOWX Designer**](../../../terms/flowx-ai-designer) and navigate to [**Process Definitions**](../../../terms/flowx-process-definition).
2. Locate and select your specific process from the list, then click on **Edit Process**.
3. Choose a **task node**, and click the **Edit** button (represented by a key icon). This action will open the node configuration menu.
4. Inside the node configuration menu, head to the [**Actions**](../../../terms/flowx-actions) tab and click the "**+**" button to add a new action.
5. From the dropdown menu, select the action type as **Business Rule**.
6. In the **Language** dropdown menu, pick **DMN**.


For a visual guide, refer to the following recording:

![Creating a DMN Business Rule Action](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/create_dmn_business_rule_action.gif)

### Using a DMN Business Rule Action

Consider a scenario where a bank needs to perform client information tasks/actions to send salutations, similar to what was previously created using MVEL [here](./business-rule-action.md#mvel-example). 

A business person or specialist can use DMN to design this business rule, without having to delve into technical definitions.

Here is an example of an [MVEL](../../../platform-overview/frameworks-and-standards/business-process-industry-standards/intro-to-mvel.md) script defined as a business rule action inside a [Service Task](../../node/task-node.md) node:

```java
if (input.application.client.gender == 'F') {
    output.put("application", {
        "client": {
            "salutation": "Ms"
        }
    });
} else if (input.application.client.gender == 'M') {
    output.put("application", {
        "client": {
            "salutation": "Mr"
        }
    });
} else {
    output.put("application", {
        "client": {
            "salutation": "Mx"
        }
    });
}
```

The previous example can be easily transformed into a DMN Business Rule action represented by the decision table:

![DMN Decision Table](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/dmn_decision_ex.png)

In the example above, we used FEEL expression language to write the rules that should be met for the output to occur. FEEL defines a syntax for expressing conditions that input data should be evaluated against.

**Input** - In the example above, we used the user-selected gender from the first screen as input, bound to the `application.client.gender` key.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/dmn_screen.png)

**Output** - In the example above, we used the salutation (bound to `application.client.salutation`) computed based on the user's gender selection.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/dmn_salutation.png)

DMN also defines an XML schema that allows DMN models to be used across multiple DMN authoring platforms. The following output is the XML source of the decision table example from the previous section:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="https://www.omg.org/spec/DMN/20191111/MODEL/" id="definitions_04nvgw7" name="definitions" namespace="http://camunda.org/schema/1.0/dmn" exporter="dmn-js (https://demo.bpmn.io/dmn)" exporterVersion="11.0.1">
  <decision id="decision_0jwmnrf" name="">
    <decisionTable id="decisionTable_1bfocm1">
      <input id="input1" label="">
        <inputExpression id="inputExpression1" typeRef="string">
          <text>application.client.gender</text>
        </inputExpression>
      </input>
      <output id="output1" label="" name="application.client.salutation" typeRef="string" />
      <rule id="DecisionRule_0ajc5qs">
        <inputEntry id="UnaryTests_1txivb8">
          <text>"M"</text>
        </inputEntry>
        <outputEntry id="LiteralExpression_19vv224">
          <text>"Mr"</text>
        </outputEntry>
      </rule>
      <rule id="DecisionRule_0crxiem">
        <inputEntry id="UnaryTests_0lj9euc">
          <text>"F"</text>
        </inputEntry>
        <outputEntry id="LiteralExpression_1nyw87v">
          <text>"Ms"</text>
        </outputEntry>
      </rule>
      <rule id="DecisionRule_1o4wvbu">
        <inputEntry id="UnaryTests_05j2uy2">
          <text>"O"</text>
        </inputEntry>
        <outputEntry id="LiteralExpression_1rw5tva">
          <text>"Mx"</text>
        </outputEntry>
      </rule>
    </decisionTable>
  </decision>
</definitions>

```
