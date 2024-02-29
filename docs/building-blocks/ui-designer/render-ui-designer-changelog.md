# Rendering and UI Designer changelog

:::caution
This changelog is relevant to the 3.0 release, which introduces significant changes to the UI configuration.
:::

Please be aware that a process (when it comes to UI configuration) may look different from previous releases and that certain updates may not be compatible with older configurations. The migration process may take longer than usual.

## Notes for post-migration

After migrating to the 3.0 release, please take in consideration the following changes to ensure smooth operation:

1. Verify font sizes where float values were set.
2. Verify line heights where scale values were set.
3. Verify border radius values where values other than px were set.
4. Review and set padding and margin values where needed. Deleted keys include "margin" : "8px 0" and "padding" : "16px 0 0 16px".
5. Check [radio](../../building-blocks/ui-designer/ui-component-types/form-elements/radio-form-field) and [checkbox](../../building-blocks/ui-designer/ui-component-types/form-elements/checkbox-form-field) elements and update the new `label` prop that has been added.
6. Configure the new `column` prop for Layout (available for checkbox and radio), which allows for grouping many enumerations.
7. The height prop (from [Container](../../building-blocks/ui-designer/ui-component-types/root-components/container), [Form](../../building-blocks/ui-designer/ui-component-types/form-elements) and [Card](../../building-blocks/ui-designer/ui-component-types/root-components/card)) has been removed.
8. Update the width prop by configuring the new `Fit W` prop with values such as fill, fixed, or auto.
`Min H` and `Max H` props have been removed.
9. The hint and message UI components were combined into a single component called 'message' with the following properties: `type`, `fill`, `border`, and `text`.
10. The [button](./ui-component-types/buttons) element no longer has the `fill`, `border`, and `flat` types. It now has 4 types: `primary`, `secondary`, `ghost`, and `text`.
11. Added Helpertext (to replace Info tooltip) - this new element can be found on [Form elements](./ui-component-types/form-elements) and provides additional information about each element, which can be hidden within an infopoint.
