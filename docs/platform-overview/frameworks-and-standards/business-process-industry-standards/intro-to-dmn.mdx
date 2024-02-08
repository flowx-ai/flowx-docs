# Intro to DMN

As we've seen in the previous chapter, Business Process Model and Notation ([**BPMN**](intro-to-bpmn/)) is used to define business processes as a sequence of activities. If we need to branch off different process paths, we use gateways. These have rules attached to them in order to decide on which outgoing path should the process continue on.

![Process with gateways](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-overview/frameworks-and-standards/business-process-industry-standards/process_with_gateways.png)

:::info
For more information on how to define DMN gateway decisions, check the [**Exclusive gateway node**](../../../building-blocks/node/exclusive-gateway-node.md) section.
:::

We needed a convenient way of specifying the [**business rules**](../../../terms/business-rules) and we picked two possible ways of writing business rules:

* defining them as DMN decisions

:::info
You can now define a DMN Business Rule Action directly in [**FLOWX Designer**](../../../terms/flowx-ai-designer). For more information, check the [**DMN Business Rule Action**](../../../building-blocks/actions/business-rule-action/dmn-business-rule-action.md) section.
:::

* adding [MVEL](intro-to-mvel.md#what-is-mvel) scripts

### What is Decision Model and Notation (DMN)?

**Decision Model and Notation** (or DMN) is a graphical language that is used to specify business decisions. DMN acts as a translator, converting the code behind complex decision-making into easily readable diagrams.

**The Business Process Model and Notation** is used to create the majority of process models **(BPMN)**. The DMN standard was developed to complement BPMN by providing a mechanism for modeling decision-making represented by a Task within a process model. DMN does not have to be used in conjunction with BPMN, but it is highly compatible.

:::warning
FLOWX.AI supports [DMN 1.3](https://www.omg.org/spec/DMN/1.3/) version.
:::

### DMN Elements

There are 4 basic elements of the **Decision Model and Notation**:

* [Decision](intro-to-dmn.md#decision)
* [Business Knowledge Model](intro-to-dmn.md#business-knowledge-model)
* [Input Data](intro-to-dmn.md#input-data)
* [Knowledge Source](intro-to-dmn.md#knowledge-source)



![Basic DMN Diagram](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-overview/frameworks-and-standards/business-process-industry-standards/dmn_diagram.png)

#### Decision

It’s the center point of a DMN diagram and it symbolizes the action that determines as output the result of a decision.

**Decision service**

A decision service is a high-level decision with well-defined inputs that is made available as a service for invocation. An external application or business process can call the decision service (BPMN).

#### Business Knowledge Model

It portrays a specific knowledge within the business. It stores the origin of the information. Decisions that have the same logic but depend on different sub-input data or sub-decisions use business knowledge models to determine which procedure to follow.

**Example:** a decision, rule, or standard table.

#### Input Data

This is the information used as an input to the normal decision. It’s the variable that configures the result. Input data usually includes business-level concepts or objects relevant to the business.

**Example:** Entering a customer’s tax number and the amount requested in a credit assessment decision.

#### Knowledge Source

It’s a source of knowledge that conveys a kind of legitimacy to the business.

**Example**: policy, legislation, rules.

### DMN Decision Table

A decision table represents decision logic which can be depicted as a table in Decision Model and Notation. It consists of inputs, outputs, rules, and hit policy.

| Decision table elements |                                                                                                                                                                                                                                                                                                 |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Inputs                  | A decision table can have one or more input clauses, that represent the attributes on which the rule should be applied.                                                                                                                                                                         |
| Outputs                 | Each entry with values for the input clause needs to be associated with output clauses. The output represents the result that we set if the rules applied to the input are met.                                                                                                                 |
| Rules                   | Each rule contains input and output entries. The input entries are the condition and the output entries are the conclusion of the rule. If each input entry (condition) is satisfied, then the rule is satisfied and the decision result contains the output entries (conclusion) of this rule. |
| Hit policy              | The hit policy specifies what the result of the decision table is in cases of overlapping rules, for example, when more than one rule matches the input data.                                                                                                                                   |

**Hit Policy examples**

import Tabs from '@theme/Tabs';

import TabItem from '@theme/TabItem';

<Tabs>
<TabItem value="unique" label="Unique">
<ul>
<li>unique result</li>
<li>only one rule will match, or no rule</li>
</ul>
</TabItem>

<TabItem value="first" label="First">
<ul>
<li>unique result</li>
<li>the order matter</li>
<li>continues with the first rule that matches</li>
</ul>
</TabItem>

<TabItem value="priority" label="Priority">
<ul>
<li>rule outputs are prioritized</li>
<li>rules may overlap, but only match with the highest output priority counts </li>
</ul>
</TabItem>

<TabItem value="any" label="Any">
<ul>
<li> unique results </li>
<li>multiple rules can be satisfied </li>
<li>all satisfied rules must generate the same output, otherwise the rule is violated</li>
</ul>
</TabItem>

<TabItem value="ruleorder" label="Rule order">
<ul>
<li>multiple results</li>
<li>the rules are evaluated in the order they are defined</li>
<li>the satisfied rules can generate different outputs</li>
</ul>
</TabItem>

<TabItem value="collectorder" label="Collect order">
<ul>
<li> multiple results </li>
<li>the rules are evaluated in an arbitrary order </li>
<li> the satisfied rules can generate different outputs </li>
<li>can contain aggregators - that apply an aggregation operation on all the outputs resulted from the rule evaluation:</li>
  <ul> 
  <li>SUM</li>
  <li>MIN</li>
  <li>MAX</li>
  <li>COUNT</li>
  </ul>
</ul>
</TabItem>
</Tabs>

### DMN Model

DMN defines an XML schema that allows DMN models to be used across multiple DMN authoring platforms.

You can use this XML example with FLOWX Designer, adding it to a Business Rule Action - using an MVEL script. Then you can switch to DMN if you need to generate a graphical representation of the model.

### Using DMN with FLOWX Designer

As mentioned previously, DMN can be used with FLOWX Designer for the following scenarios:

* For defining gateway decisions, using [exclusive gateways](../../../building-blocks/node/exclusive-gateway-node.md).
* For defining [business rules actions](../../../building-blocks/actions/business-rule-action/business-rule-action.md) attached to a [task node](../../../building-blocks/node/task-node.md).

### In depth docs

[DMN Documentation](https://www.omg.org/dmn)