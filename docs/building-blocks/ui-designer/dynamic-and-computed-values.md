# Dynamic & computed values

In modern application development, the ability to create dynamic and interactive user interfaces is essential for delivering personalized and responsive experiences to users. Dynamic values and computed values are powerful features that enable developers to achieve this level of flexibility and interactivity.

## Dynamic values

Dynamic values exemplify the capacity to dynamically populate various properties of UI elements in response to process parameters or substitution tags. This dynamic customization occurs at runtime, allowing the application to adapt to specific scenarios or user inputs. With dynamic values, the UI can be tailored down to details, including labels, placeholders, error messages, and other properties.

This capability is now extended to an array of UI elements and their corresponding properties, utilizing process parameters or [**substitution tags**](../../platform-deep-dive/core-components/core-extensions/content-management/substitution-tags.md):


| Element                                                                 | Property                                                         | Accepts Params/Subst Tags |
| ----------------------------------------------------------------------- | ---------------------------------------------------------------- | ------------------------- |
| [**Form Elements**](./ui-component-types/form-elements)                 | Default Value (except switch)                                    | Yes                       |
|                                                                         | Label, Placeholder                                               | Yes                       |
|                                                                         | Helper Text, Validators                                          | Yes                       |
| [**Document Preview**](./ui-component-types/file-preview.md)            | Title, Subtitle                                                  | Yes                       |
| [**Card**](./ui-component-types/root-components/card.md)                | Title, Subtitle                                                  | Yes                       |
| Form                                                                    | Title                                                            | Yes                       |
| Message                                                                 | Message                                                          | Yes                       |
| [**Buttons**](./ui-component-types/buttons.md)                          | Label                                                            | Yes                       |
| Select, Checkbox, Radio,Segmented Button (Static)                       | Label, Value                                                     | Subst Tags Only           |
| Text                                                                    | Text                                                             | Yes                       |
| Link                                                                    | Link Text                                                        | Yes                       |
| [**Modal**](../../building-blocks/node/milestone-node.md#modal)         | Modal Dismiss Alert, Title, Message, Confirm Label, Cancel Label | Yes                       |
| [**Step**](../../building-blocks/node/milestone-node.md#stepper--steps) | Label                                                            | Yes                       |

### Example using Substitution tags

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release-notes/dynamic_val.gif)

### Example using process parameters

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/dynamic_values_params.gif)

#### Business rule example

In the preceding example, an MVEL business rule demonstrates the population of specific keys with dynamic values from the task. This JSON object, assigned to the "app" key, captures the values for various UI properties:

```json
///assigning a JSON object containing dynamic values for the specified keys to the "app" key 

output.put("app",{"label":"This is a label",
                    "title":"This is a title",
                    "placeholder":"This is a placeholder",
                    "helpertext":"This is a helper text",
                    "errorM":"This is a error message",
                    "prefix":"prx",
                    "suffix":"sfx",
                    "subtitile":"This is a subtitle",
                    "message":"This is a message",
                    "defaultV":"defaultValue",
                    "value":"Value101",
                    "value":"Value101",
                    "confirmLabel":"This is a confirm label",
                    "cancelLabel":"This is a cancel label",
                    "defaultValue":"dfs",
                    "defaultDate":"02.02.2025",
                    "defaultSlider": 90});

```

:::caution
Note that for releases **<= 3.3.0**, concatenating process parameters with substitution tags isn't supported when utilizing dynamic values.
:::

## Computed values

Computed values present a method to dynamically generate values using JavaScript expressions. Beyond adhering to predefined values, computed values enable the manipulation, calculation, and transformation of data grounded in particular rules or conditions.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/computed1.png)

Computed values can be created via JavaScript expressions that operate on process parameters or other variables within the application.

:::info
To introduce a computed value, you simply toggle the "Computed value" option (represented by the **f(x)** icon). This will transform the chosen field into a JavaScript editor.

<div class = "image-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/computed_default_value.png)

</div>

:::

By enabling computed values, the application provides flexibility and the ability to create dynamic and responsive user interfaces.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release-notes/computed.gif)

### Slider example (parsing keys as integers)

The instance above showcases computed values' usage in a Slider element. JavaScript expressions are used to dynamically compute minimum and maximum values based on a value sourced from a linked input UI element (connected via the process key `${application.client.amount}`).

#### Minimum Value

```js
if ( !isNaN(parseInt(${application.client.amount})) ) {
    return 0.15 * parseInt(${application.client.amount})
}  else {
    return 10000
}
```

* `!isNaN(parseInt(${application.client.amount}))`: This part ascertains whether the value in the input field `(${application.client.amount})` can be effectively converted to an integer using `parseInt`. Moreover, it validates that the outcome isn't `NaN` (i.e., not a valid number), ensuring input validity.
* If the input is a valid number, the minimum value for the slider is calculated as 15% of the entered value `(0.15 * parseInt(${application.client.amount}))`.
* If the input is not a valid number `(NaN)`, the minimum value for the slider is set to 10000.


#### Maximum Value

```js
if ( !isNaN(parseInt(${application.client.amount})) ) {
    return 0.35 * parseInt(${application.client.amount})
}  else {
    return 20000
}
```

* Similar to the previous expression, it checks if the value entered on the input field is a valid number using `!isNaN(parseInt(${application.client.amount}))`.
* If the input is a valid number, the maximum value for the slider is calculated as 35% of the entered value `(0.35 * parseInt(${application.client.amount}))`.
* If the input is not a valid number `(NaN)`, the maximum value for the slider is set to 20000.


#### Summary

In summary, the above expressions provide a dynamic range for the slider based on the value entered on the input field. If a valid numeric value is entered, the slider's range will be dynamically adjusted between 15% and 35% of that value. If the input is not a valid number, a default range of 10000 to 20000 is set for the slider. This can be useful for scenarios where you want the slider's range to be proportional to a user-provided value.


### Text example (using computed strings)

The following scenario outlines the functionality and implementation of dynamically displaying property types (using a text UI element) based on the selected loan type (using a select UI element) in a user interface.

The following scenario outlines the functionality and implementation of dynamically displayed property types via a text UI element. This is done based on the chosen loan type through a select UI element in a user interface.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/dynamic_string.gif)

#### Scenario

The UI in focus showcases two primary UI elements:

* Select Element - "Loan type": This element allows users to choose from different loan types, including "Conventional," "FHA," "VA," and "USDA."

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/loan_type.png#left) ![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/select_values.png#right)

* Text Element - "Property type": This element displays property types based on the selected loan type.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/property_type.png)

The following code snippet illustrates how the dynamic property types are generated based on the selected loan type (JavaScript is used): 

```javascript
if ("${application.loanType}" == "conventional") {
    return "Single-Family Home, Townhouse CondoMulti-Family, Dwelling";
} else if ("${application.loanType}" == "fha") {
    return "Single-Family Home, Townhouse, Condo, Manufactured Home";
} else if ("${application.loanType}" == "va") {
    return "Single-Family Home, Townhouse, Condo, Multi-Family Dwelling";
} else if ("${application.loanType}" == "usda") {
    return "Single-Family Home, Rural Property, Farm Property";
} else {
    return "Please select a loan type first";
}
```

#### Summary

* **Loan Type Selection**: Users interact with the "Loan Type Select Element" to choose a loan type, such as "Conventional," "FHA," "VA," or "USDA."
* **Property Types Display**: Once a loan type is selected, the associated property types are dynamically generated and displayed in the "Text Element."
* **Fallback Message**: If no loan type is selected or an invalid loan type is chosen, a fallback message "Please select a loan type first" is displayed.

### Integration across the UI elements

The UI Designer allows the inclusion of JavaScript expressions for generating computed values. This functionality extends to the following UI elements and their associated properties:

| Element                                | Properties                          |
| -------------------------------------- | ----------------------------------- |
| Slider                                 | min Value, max Value, default Value |
| Input                                  | Default Value                       |
| Any UI Element that accepts validators | min, max, minLength, maxLength      |
| Text                                   | Text                                |
| Link                                   | Link Text                           |


- **Slider**: The min value, max value, and default value for sliders can be set using JavaScript expressions applied to process parameters. This allows for dynamic configuration based on numeric values.
- **Any UI Element that accepts validators min, max, minLength, maxLength**: The "params" field for these elements can also accept JavaScript expressions applied to process parameters. This enables flexibility in setting validator parameters dynamically.
- **Default Value**: For input elements like text inputs or number inputs, the default value can be a variable from the process or a computed value determined by JavaScript expressions.
- **Text**: The content of a text element can be set using JavaScript expressions, allowing for dynamic text generation or displaying process-related information.
- **Link**: The link text can also accept JavaScript expressions, enabling dynamic generation of the link text based on process parameters or other conditions.


:::caution
When working with computed values, it's important to note that they are designed to be displayed as integers and strings.
:::

:::caution
For input elements (e.g., text input), you may require a default value from a process variable, while a number input may need a computed value.
:::

