# Collection Prototype

## Overview

A Collection Prototype is an additional container type that allows you to define multiple prototypes for a single Collection. This feature enables you to display elements from the same collection differently.

For instance, imagine you are designing a user interface where users can browse a list of products, with one product deserving special emphasis as the recommended choice. In this scenario, you can employ a collection containing different collection prototypes, each tailored for regular and recommended products

## Configurable properties:

1. **Prototype Identifier Key** - This key instructs the system on where to look within the iterated object to identify the prototype to display. In the example below, the key is "type."
2. **Prototype Identifier Value** - This value should be present at the Prototype Identifier Key when this `COLLECTION_PROTOTYPE` should be displayed. In the example below, the value can be "normal" or "recommended."

## Example

Let's revisit the example we used in the Collection section:

![Collection prototype for normal product](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/c.prototype1.png) 

![Collection prototype for recommended product](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/c.prototype2.png)

Sample source collection data for products:

```java
output.put("processData", 
{
  "products": [ 
    {
      "name": "Product One Plus",
      "description": "The plus option",
      "type": "normal"
    },
    {
      "name": "Product Two Premium",
      "description": "This is premium product",
      "type": "recommended" // source for type - recommended
    },
    {
      "name": "Product Basic",
      "description": "The most basic option",
      "type": "normal" //source for type - normal
    },
    {
      "name": "Gold Product",
      "description": "The gold option",
      "type": "normal"
    }
  ]
}
);
```
The above configuration will render:

![Collection with two prototypes as rendered by the SDK](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/render_collection.gif)

## Adding elements with UI Actions

When configuring elements that incorporate UI Actions there are a few considerations to keep in mind. These adjustments are necessary to enable users to select products for further processing in subsequent steps of the workflow.

### Step 1 - Defining the Node Action

To facilitate the selection of a product from the list, you must first add an [Action](../../../actions/actions.md) to the [User Task Node](../../../node/user-task-node.md) associated with this UI element:

![Node Action that saves the selected product to the process's data.](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/col_prot_action.png)

This **save-item** action is categorized as **manual** since it is user-triggered and **mandatory** because product selection is a prerequisite for proceeding to the next [Node](../../../node/) in the process. Additionally, it is marked as **Repeatable** to allow users to change their selected product.

Pay attention to the **Data to send** section, which specifies where in the **process data** the selected product (the one the user clicked on) should be saved. In this example, it is saved under the `selectedProduct` key.

### Step 2 - Adding the UI Action

Now that you have a [Node Action](../../../actions/actions.md) defined, you can proceed to add a UI action to the collection prototype. This UI action can be added directly to the collection prototype UI element or other UI elements within it that support UI actions. For more information on UI actions, click [<u>**here**</u>](../../ui-actions.md).

![Select product element and its UI Action configuration](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/add_ui_action_col_prot.png)

**Collection Item Save Key** field has an important role in the UI Action configuration of element with the UI action. This field represents how we pass the value of the **Product** that the user has selected to the [Node Action](../../../actions/actions.md) that we created in [**Step 1**](#step-1---defining-the-node-action), named _save-item_.

In our example, we set **Collection Item Save Key** to be `selectedProduct`.

:::warning
**IMPORTANT**: The `selectedProduct` key is how we expose the data from the **Collection** to the [Node Action](../../../actions/actions.md) It is **imperative** that the name in the **Collection Item Save Key** is the same as the one used in the **Data to send** input in the Node Action.
:::

### Result

Before clicking the collection prototype UI element with the attached UI action, this is how the process data appears:

![Process data before selecting a product](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/c.prototype_result.png)

After selecting a product from the list (notice the new field`selectedProduct`):

![Process data after selecting a product](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/c.prototype_result_final.png)
