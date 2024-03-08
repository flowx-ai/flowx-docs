---
sidebar_position: 1
--- 

# Swimlanes

:::info
**What is it?** Swimlanes provide a way of grouping process nodes by process participants.

**Why is it useful?** Using swimlanes we can make sure only certain user roles have access to certain process nodes.
:::

In certain scenarios, it is necessary to restrict access to specific process [**nodes**](../../terms/flowx-node) based on user roles. This can be achieved by organizing nodes into different swimlanes. 

Each swimlane can be configured to grant access only to users with specific roles defined in the chosen identity provider platform.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/multiple_swimlanes.png)

Depending on the type of node added within a swimlane, only users with the corresponding swimlane roles will have the ability to initiate process instances, view process instances, and perform actions on them.

[Click here to view the list of scopes and roles for managing processes](../../platform-setup-guides/flowx-engine-setup-guide/configuring-access-rights-for-engine.md)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/swimlanes_permissions.gif)

When creating a new process definition, a default swimlane will automatically be added.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-deep-dive/swimlanes_default.gif)

As the token moves from one node to the next, it may transition between swimlanes. If a user interacting with the process instance no longer has access to the new swimlane, they will observe the process in read-only mode and will be unable to interact with it until the token returns to a swimlane they have access to.

Users will receive notifications when they can no longer interact with the process or when they can resume actions on it.

[Configuring access roles for processes](../../platform-setup-guides/flowx-engine-setup-guide/configuring-access-roles-for-processes.md)