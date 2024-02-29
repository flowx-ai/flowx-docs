# File Preview

### What is a File Preview UI element?

The File Preview UI element is a user interface component that enables users to preview the contents of files quickly and easily without fully opening them. It can save time and enhance productivity, providing a glimpse of what's inside a file without having to launch it entirely.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/doc_preview.gif)

File Preview UI elements offer various benefits such as conveying information, improving the aesthetic appeal of an interface, providing visual cues and feedback or presenting complex data or concepts in a more accessible way.

## Configuring a File Preview element

A File Preview element can be configured for both mobile and web applications.

### File Preview properties (web)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/doc_preview_upload.gif)

The File Preview element settings consist of the following properties:

* **Title** - the title of the element (if it is downloaded or shared - the file name should be the title used in preview component)
* **Has subtitle** - the subtitle of the element
* **Display mode** - depending on the selected display method the following properties are available:
    * **Inline** → **Has accordion**:  
        * `false` - display preview inline, without expand/collapse option
        * `true` - Default View: Collapsed - display preview inline, with expand/collapse option, by default collapsed
        * `true` - Default View: Expanded - display preview inline, with expand/collapse option, by default expanded

    * **Modal** → view icon is enabled 
* **Source Type** - 
    * **Process Data** - process key where the document is found (creates the binding between the element and process data)
    * **Static** - URL of the document

:::caution
It's worth noting that the inline modal view can raise accessibility issues if the file preview's height exceeds the screen height.
:::


### File Preview properties (mobile)



:::info
Both iOS and Android devices support the share button.
:::

#### iOS

<div className= "gif-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/doc_preview_ios.gif)

</div>

#### Android

<div className= "gif-scaled">

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/doc_preview_android.gif)

</div>
    

### File preview styling

The File Preview styling property enables you to customize the appearance of the element by adding valid CSS properties, for more details, click [here](../../ui-designer/ui-designer.md#styling).

When drag and drop a File Preview element in UI Designer, it comes with the following default styling properties:

#### Sizing

* **Fit W** - auto
* **Fit H** - fixed / Height - 400 px

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/doc_preview_styling.png)


## File Preview example

Below is an example of a File Preview UI element with the following properties:

* **Display mode** - Inline
* **Has accordion** - True
* **Default view** - Expanded
* **Source Type** - Static

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/ui-designer/doc_preview_example.gif)