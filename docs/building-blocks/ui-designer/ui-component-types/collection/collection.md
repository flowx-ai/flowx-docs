---
sidebar_position: 2
---

# Collection

The Collection component is similar to a [Container element](../root-components/custom.md), allowing you to iterate through a list of elements and display them according to their configuration.


## Configurable properties:

* `collectionSource` - This property specifies the process key where a list can be found. It should be a valid array of objects.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/collection_source_key1.png)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/%20collection_source_key.png)

## Example

Here's an example of configuring a Collection component to display a list of products:

![Collection configuration for displaying employees](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/collection_example.png)

Source collection data example using an [**MVEL business rule**](../../../actions/business-rule-action/business-rule-action.md):


![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/collection_mvel.png)

```java
output.put("processData", //this is the key
{
  "products": [ // this is the source that will populate the data on collection
    {
      "name": "Product One Plus",
      "description": "The plus option",
      "type": "normal"
    },
    {
      "name": "Product Two Premium",
      "description": "This is premium product",
      "type": "recommended"
    },
    {
      "name": "Product Basic",
      "description": "The most basic option",
      "type": "normal"
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

The above example will render as follows:

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/render_collection.gif)

:::info
Components used inside a collection use **relative paths** to the collection source. This means that wherever the collection is found inside the process data, the components inside the collection need their keys configured relative to that collection.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/collection_relative_key.png)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/collection_key_rule.png)
:::

:::warning
To send and display dynamic data received on the keys you define to the frontend, make sure to include the following data structure in your root UI element using Message parameters. For instance, if you want to include data for the `processData` key mentioned earlier, your configuration should resemble this:
```json
{
  "processData": ${processData}
}
```
:::

:::caution
To enable the definition of multiple prototypes for a single Collection and display elements from the same collection differently, an additional container known as a *collection prototype* is required. For more information on collection prototypes, please refer to the next section:
:::

[Collection prototype](collection_prototype.md)