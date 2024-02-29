---
sidebar_position: 1
---

# Container

A container in Flowx is a versatile building block that empowers you to group components and arrange them as needed, providing flexibility in UI design. It can also serve as the root component for your design.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_designer_container.gif)

The following properties can be configured in the container:

### Properties and Settings

#### Settings

##### When Used as Root

When employed as the root component, the container offers the following settings:

* **Message**: A valid JSON describing the data sent to the frontend when the process reaches a specific user task. 
* **Expressions (Hide)**: JavaScript expressions utilized to dynamically hide components based on conditions.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/container_root.png)

:::caution
Starting with platform version **3.4.7**, the term "Message" has evolved into "Custom UI Payload." In the context of a User Task containing UI Elements, a significant enhancement has been introduced: when the page is rendered, the Backend (BE) now automatically transmits to the Frontend (FE) all pertinent data as process variables, seamlessly matching keys. This eliminates the need for explicit mentions of data that require pushing, streamlining the configuration process and enhancing overall efficiency.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/container_custom_ui.png)
:::


##### When Not Used as Root

When the container is not used as the root, you can configure only the **Hide Condition** property.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_designer_container_settings.png)

By leveraging containers, you gain the ability to structure your UI elements efficiently, enhancing the overall design and usability of your application.

### Styling

* **Layout** - this property is available for components that group children and includes the following options:

    * Direction - Horizontal / Vertical (for example, select *Horizontal*)
    * Justify (H) - (for example, select *end*)
    * Align (V) - this option allows you to align components vertically
    * Gap - you can set the gap between components

More layout demos available below:

[Layout Demos](https://tburleson-layouts-demos.firebaseapp.com/#/docs)

When you apply the above properties, you can generate the following output, with the button appearing on the right side of the container, underneath the form with three form elements:

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/container_styling.png)

For more information about styling and layout configuration, check the following section:

[UI Designer](../../ui-designer.md#styling)