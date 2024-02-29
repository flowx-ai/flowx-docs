---
sidebar_position: 3
---
# UI Designer

## What is UI Designer?

The FLOWX.AI platform offers a variety of ready-to-use [UI components](./ui-component-types/ui-component-types.md) that can be used to create rich web interfaces. These include common form elements like [input fields](./ui-component-types/form-elements/input-form-field.md), [dynamic dropdown menus](./ui-component-types/form-elements/select-form-field.md#example---dynamic-dropdowns), [checkboxes](./ui-component-types/form-elements/checkbox-form-field.md), [radio](./ui-component-types/form-elements/radio-form-field.md), and [switch buttons](./ui-component-types/form-elements/switch-form-field.md), as well as other UI elements like image, text, anchor links, etc. The properties of each component can be customized further using the details tab, and [design flexibility](./#styling) is achieved by adding styles or CSS classes to the pre-defined components. The UI templates are built in a hierarchical structure, with a root component at the top.

## Using UI designer

The FLOWX.AI platform includes an intuitive **UI Designer** for creating diverse UI templates. You can use various elements such as basic buttons, indicators, and forms, as well as predefined [collections](./ui-component-types/collection/collection.md) and [prototypes](./ui-component-types/collection/collection_prototype.md). To access the UI Designer, follow these steps:

1. Open **FLOWX.AI Designer** and select **Definitions** from the **Processes** tab.
2. Select a **process** from the process definitions list.
3. Click the **Edit** **process** button.
4. Select a **node** then click the **brush icon** in the Process Designer navigation menu to open the **UI Designer**.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/access_ui_designer.gif)

:::caution
The UI designer is available for [**User task**](../node/user-task-node.md) nodes and [**Milestone**](../node/milestone-node.md) nodes (nodes that require human interaction).
:::

After adding a specific component to the node, the right-side menu will display more configuration options.

:::caution
Depending on the [component type](./ui-component-types) different properties are available for configuration.
:::

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/use_ui_designer3.gif)

:::info
For more flexibility, undo or redo actions are available within the UI Designer. This includes tasks such as dragging, dropping, or deleting elements from the preview section, as well as adjusting settings within the styling and settings panel.

To undo or redo an action, users can simply click the corresponding icons in the UI Designer toolbar, or use the keyboard commands for even quicker access.
:::

## UI components

FLOWX.AI offers a wide range of [UI components](./ui-component-types) that can be customized using the UI Designer. For example, when configuring a [card](./ui-component-types/root-components/card) element (which is a root component), the following properties can be customized:


#### Settings

* **Message** - a valid JSON string that is pushed to the frontend application when the process reaches [user task](../node/user-task-node.md); this property is only available for [Root components](./ui-component-types/root-components/root-components.md)
* **Properties** - custom properties that vary depending on the component type
* **Has Accordion** (available only for **Card** component) - a Bootstrap accordion is a component that organizes content within collapsible items, allowing only one collapsed item to be displayed at a time

<div className= "image-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_designer_settings.png)

</div>

[Root components](./ui-component-types/root-components)

By utilizing the UI Designer, users can easily create rich web interfaces with customizable UI components.

## Styling

In FLOWX.AI, styling options are available for components that group children, which can be found under the styling section. 

Users can customize the direction, alignment, gap, sizing, and spacing of their layout. These properties help to create well-organized and visually pleasing user interfaces.

### Layout 

Layout configuration is available for components that group children: [root components](./ui-component-types/root-components/) and [forms](./ui-component-types/form-elements/form-elements.md) (more details about layouts can be found [here](https://tburleson-layouts-demos.firebaseapp.com/#/docs)):

   * Direction - horizontal or vertical
   * Alignment - start, center, end, stretch
   * Wrap - content will wrap to the next line when it reaches the end of a line within the element
   * Gap - the gap property defines the size of the gap between the rows and between the columns

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/layout_styling.gif)

[Layout](https://tburleson-layouts-demos.firebaseapp.com/#/docs)

### Sizing

By setting desired values for these props, you can ensure that all UI elements on the interface are the desired size and perfectly fit with each other. 

When adjusting the Fit W and Fit H settings, users can control the size and shape of the elements as it appears on their screen:

* Fit W: fill, fixed or auto
* Fit H: fill, fixed or auto

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_sizing.gif)

### Spacing

Margin and padding are CSS properties used to create space between elements in a web page:

* margin - the space outside an element
* padding - the space inside an element

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_spacing.gif)

[Margin](https://www.w3schools.com/css/css_margin.asp)

[Padding](https://www.w3schools.com/css/css_padding.asp)

### Typography

* **Typography** - typography options allow users to set font styles, colors, text indentation, and other formatting options; these properties can be found under the **Typography** section

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/input_typography.png)

:::info
To learn how to upload custom font files, check the [<u>**Font Management**</u>](../../platform-deep-dive/core-components/core-extensions/content-management/font-files.md) section.
:::


### Background
 
 **Background** - the Background section allows users to set the background color for their components, accepted values:

   - a valid color name - like `red`
   - a HEX value - like `#ff0000`
   - an RGB value - like `rgb(255,0,0)`

### Border

**Border** - border properties can be customized under the **Border** section, users can set the radius, width, or color of their component's borders

[Border width](https://www.w3schools.com/css/css_border_width.asp)

[Border radius](https://www.w3schools.com/css/css_border_rounded.asp)

<div className= "image-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_designer_styling.gif#center)

</div>

### Advanced

* **Advanced** - for advanced customization, users can add CSS classes to pre-defined components, this option is available under the **Advanced** section


By utilizing these styling options in FLOWX.AI, users can create unique and visually appealing interfaces that meet their design requirements.

## Tree view

The Tree View panel displays the component hierarchy, allowing users to easily navigate through the different levels of their interface. 

Clicking on a specific component in the tree will highlight the selection in the editor, making it easy to locate and modify.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/ui_designer_tree1.gif)

For more information on the different types of components available in FLOWX.AI, please refer to the next section:

[Component types](./ui-component-types/ui-component-types.md)


