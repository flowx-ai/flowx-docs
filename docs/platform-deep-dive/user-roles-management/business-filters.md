# Business filters

:::info
**What is it?** An optional attribute, from the authorization token, that can be set in order to restrict access to process instances based on a business specific value (ex. bank branch name).

**Why is it useful?** Using business filters we can make sure only the allowed users, with the same attribute, can access a [**process instance**](../../terms/flowx-process-instance).
:::

In some cases it might be necessary to restrict access to process nodes based on certain [**business rules**](../../terms/business-rules), for example only users from a specific bank branch can view the process instances started from that branch. This can be done by using business filters.

Before they can be used in the process definition the business filter attributes need to be set in the identity management platform. They have to be configured as a list of filters and should be made available on the authorization token. Application users will also have to be assigned this value.

When this filter needs to be applied, the process definition should include nodes with actions that will store the current business filter value to a custom `task.businessFilters` key on process parameters.

If this value is set in the process instance parameters, only users that have the correct business filter attribute will be able to interact with that process instance.