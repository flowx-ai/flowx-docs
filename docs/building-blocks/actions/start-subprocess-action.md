---
sidebar_position: 4
---

# Start Subprocess action

:::info
**What is it?** A **Start Subprocess action** is an [**action**](../../terms/flowx-actions) that allows you to start a [**subprocess**](../../terms/flowx-subprocess) from another (parent) [**process**](../../terms/flowx-process).

**Why is it important?**  Using [**subprocesses**](../process/subprocess.md) is a good way to split the complexity of your business flow into multiple, simple and reusable processes.
:::

## Configuring a Start Subprocess action

To use a process as a [subprocess](../process/subprocess.md), you must first create it. Once the subprocess is created, you can start it from another (parent) process. To do this, you will need to add a **Start Subprocess** action to a [**User task**](../node/task-node.md) node in the parent process or by using a [subprocess run node](../node/subprocess-run-node.md).

Here are the steps to start a subprocess from a parent process:

1. First, create a [process](../process/process.md) designed to be used as a [subprocess](../process/subprocess.md).
2. In the parent process, create a **User task** node where you want to start the subprocess created at step 1.
3. Add a **Start Subprocess** action to the Task Node.
4. Configure the **Start Subprocess** action and from the dropdown list choose the subprocess created at step 1.

By following these steps, you can start a subprocess from a parent process and control its execution based on your specific use case.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/process_subprocess1.png)

The following properties must be configured for a **Start subprocess** action:

* [Action Edit](#action-edit)
* [Back in steps (for Manual actions)](#back-in-steps)
* [Parameters](#parameters)
* [Data to send (for Manual actions)](#data-to-send)

### Action Edit

* **Name** - used internally to make a distinction between different actions on nodes in the process. We recommend defining an action naming standard to be able to quickly find the process actions
* **Order** - if multiple actions are defined on the same node, the running order should be set using this option
* **Timer expression** - it can be used if a delay is required on that action. The format used for this is [ISO 8601 duration format ](https://www.w3.org/TR/NOTE-datetime)(for example, a delay of 30 seconds will be set up as `PT30S`)
* **Action type** - should be set to **Start Subprocess**
* **Trigger type** (options are Automatic/Manual) - choose if this action should be triggered automatically (when the process flow reaches this step) or manually (triggered by the user); in most use cases, this will be set to automatic
* **Required type** (options are Mandatory/Optional) - automatic actions can only be defined as mandatory. Manual actions can be defined as mandatory or optional.
* **Repeatable** - should be checked if the action can be triggered multiple times
* **Autorun Children** - when this is switched on, the child actions (the ones defined as mandatory and automatic) will run immediately after the execution of the parent action is finalized

### Back in steps

* **Allow BACK on this action** - back in process is a functionality that allows you to go back in a business process and redo a series of previous actions in the process. For more details, check [**Moving a token backwards in a process**](../../flowx-designer/managing-a-process-flow/moving-a-token-backwards-in-a-process.md) section.

### Parameters

* **Subprocess name** - the name of the process that you want to start as a subprocess
* **Branch** - a dropdown menu displaying available branches on the subprocess (both opened and merged)
* **Version** - the type of version that should be used within the subprocess

:::info
* **Latest Work in Progress**:
    * Displayed if the selected branch is not merged into another branch.
    * This configuration is used when there is a work-in-progress (WIP) version on the selected branch or when there is no WIP version on the selected branch due to either work in progress being submitted or the branch being merged.
    * In such cases, the latest available configuration on the selected branch is used.
* **Latest Submitted Work**:
    * This configuration is used when there is submitted work on the selected branch, and the current branch has been submitted on another branch (latest submitted work on the selected branch is not the merged version).
* **Custom Version**:
    * Displayed if the selected branch contains submitted versions.
:::

* **Custom version** - displayed if the selected branch contains submitted versions
* **Copy from current state** - if a value is set here, it will overwrite the default behavior (of copying the whole data from the subprocess) with copying just the data that is specified (based on keys)
* **Exclude from current state** - what fields do you want to exclude when copying the data from the parent process to the subprocess (by default all data fields are copied)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/subprocess_version.png)

**Advanced configuration**

* **Show Target Process** - ID of the current process, to allow the subprocess to communicate with the parent process (which is the process where this action is configured)

### Data to send

* **Keys** - are used when data is sent from the frontend via an action to validate the data (you can find more information in the [**User Task configuration**](../node/user-task-node.md) section)

:::warning
**Data to send** option is configurable only when the action **trigger type** is **Manual**.
:::



## Example

Let's create a main [**process**](../../terms/flowx-process), in this process we will add a user task node that will represent a menu page. In this newly added node we will add multiple subprocess actions that will represent menu items. When you select a menu item, a subprocess will run representing that particular menu item.


![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/subprocess_menu1.png)

To start a subprocess, we can, for example, create the following minimum configuration in a user task node (now we configure the process where we want to start a subprocess):

* **Action** - `menu_item_1` - used internally to make a distinction between different actions on nodes in the process. We recommend defining an action naming standard to be able to quickly find the process actions
* **Trigger type** - Manual; Optional
* **Repeatable** - yes
* **Subprocess** - `docs_menu_item_1` - the name of the process that you want to start as a subprocess
* **Exclude from current state** - `test.price` - copy all the data from the parent, except the price data
* **Copy from current state** - leave this field empty in order to copy all the data (except the keys that are specified in the **Exclude from current state** field), if not, add the keys from which you wish to copy the data

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/subprocess_example2.png)


**Advanced configuration**

* **Target process (parentProcessInstanceId)** - `${processInstanceId}` - current process ID

#### Result

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/subprocess_example.gif)

