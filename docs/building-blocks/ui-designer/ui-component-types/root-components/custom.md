---
sidebar_position: 3
---

# Custom Component

## Overview

Custom components are developed in the web application and referenced here by component identifier. This will dictate where the component is displayed in the component hierarchy and what actions are available for the component.

:::info
Starting with **3.4.7** platform version, for User Tasks containing UI Elements, when the page is rendered, the Backend (BE) should, by default, send to the Frontend (FE) all available data as process variables with matching keys.

If the User Task also includes a **custom component**, the BE should send, in addition to default keys, objects mentioned in the "Message" option of the root element.
:::

To add a custom component in the template config tree, we need to know its unique identifier and the data it should receive from the process model.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_designer_custom.png)

The properties that can be configured are as follows:

* **Identifier** - this will enable the custom component to be displayed in the component hierarchy and what actions are available for the component
* **Input keys** - used to define the process model paths from which the components will receive their data
* [**UI Actions**](../../ui-actions.md) - actions defined here will be made available to the custom component


<div className= "image-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_designer_custom_settings.png#center)

</div>


## Prerequisites before creation

* **Angular Knowledge**: You should have a good understanding of Angular, as custom components are created and imported using Angular.

* **Angular CLI**: Ensure that you have Angular CLI installed.

* **Development Environment**: Set up a development environment for Angular development, including Node.js and npm (Node Package Manager).

* **Component Identifier**: You need a unique identifier for your custom component. This identifier is used for referencing the component within the application.

## Creating a Custom component

To create a Custom Component in Angular, follow these steps:

1. Create a new Angular component using the Angular CLI or manually.
2. Implement the necessary HTML structure, TypeScript logic, and SCSS styling to define the appearance and behavior of your custom component.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/loader_comp.png)

## Importing the component

After creating the Custom Component, you need to import it into your application.

In your `app.module.ts` file (located at src → app → app.module.ts), add the following import statement:

```ts
`import { YourComponent } from '@app/components/yourComponent.component'`
```

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/import_cus.gif)

## Declaration in AppModule

In the same `app.module.ts` file, declare your Custom Component within the `declarations` array in the `@NgModule` decorator:

```ts
@NgModule({
  declarations: [
    // ...other components
    YourComponent
  ],
  // ...other module configurations
})

```

## Declaration in FlxProcessModule

To make your Custom Component available for use in processes created in FLOWX Designer, you need to declare it in `FlxProcessModule`.

In your process.module.ts file (located at src > app > modules > process > process.module.ts), add the following import statement:

```ts
import { YourComponent } from '@app/components/yourComponent.component';
```

Then, declare your Custom Component in the `FlxProcessModule.forRoot` function:

```ts
FlxProcessModule.forRoot({
  components: {
    // ...other components
    yourComponent: YourComponent
  },
  // ...other module configurations
})

```

## Using the custom component

Once your Custom Component is declared, you can use it for configuration within your application. 

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/loader_component.gif)

## Data input and actions

The Custom Component accepts input data from processes and can also include actions extracted from a process. These inputs and actions allow you to configure and interact with the component dynamically.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/cst_input_data.png)

## Extracting Data from Processes

There are multiple ways to extract data from processes to use within your Custom Component. You can utilize the data provided by the process or map actions from the BPMN process to Angular actions within your component.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/cst_loader_input.png)

:::danger
Make sure that the Angular actions that you declare match the names of the process actions.
:::

## Styling with CSS

To apply CSS classes to UI elements within your Custom Component, you first need to identify the UI element identifiers within your component's HTML structure. Once identified, you can apply defined CSS classes to style these elements as desired.

Example:

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/Screenshot%202023-10-10%20at%2012.29.51.png)

## Custom component example

Below you can see an example of a basic custom loader component built with Angular:

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/2023-10-10%2012.01.58.gif)

## Additional Considerations:

* **Naming Conventions**: Be consistent with naming conventions for components, identifiers, and actions. Ensure that Angular actions match the names of process actions as mentioned in the documentation.

* **Component Hierarchy**: Understand how the component fits into the overall component hierarchy of your application. This will help determine where the component is displayed and what actions are available for it.

* **Documentation and Testing**: Document your custom component thoroughly for future reference. Additionally, testing is crucial to ensure that the component behaves as expected in various scenarios.

* **Security**: If your custom component interacts with sensitive data or performs critical actions, consider security measures to protect the application from potential vulnerabilities.

* **Integration with FLOWX Designer**: Ensure that your custom component integrates seamlessly with FLOWX Designer, as it is part of the application's process modeling capabilities.