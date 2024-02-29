---
sidebar_position: 5
---
# Token

Token is the concept that describes the current position in the process flow. When you start the process you have a graph of [nodes](./node/node.md) and based on the configuration you will go from one to another based on the defined sequence (connection between nodes).

The token is a [BPMN](../platform-overview/frameworks-and-standards/business-process-industry-standards/intro-to-bpmn/intro-to-bpmn.md) concept that represents a state within a process instance. It keeps track of the current position in the process flow and is used to store data related to the current process instance state.

A token is created each time a new process instance is started. As the actions on the process instance are executed, the token advances from one node to the next. As a node can have several [actions](./actions/actions.md) that need to be executed, the token is also used for keeping track of the actions executed in each node.

In case of [parallel gateways](./node/parallel-gateway.md), child tokens are created for each flow branch. The parent token moves to the gateway sync node and only advances after all the child tokens also reach that node.

The image below shows how a token advances through a process flow:

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/image%20%28140%29%20%281%29%20%281%29%20%281%29%20%281%29%20%281%29.png)

The token will only move to the next node when there are no more mandatory actions from the current node that need to be executed. The token will also wait on a node in case the node is set to receive an event from an external system through Kafka.

There will be cases when the token needs to be stopped in a node until some input is received from the user. If the input from the user is needed for further advancing in the process, the token should only advance after all data was received. A mandatory manual action can be used in this case and linked to the user action. This way we make sure that the process flow advances only after the user input is received.

### Checking the token status

The current process instance status can be retrieved using the FLOWX Designer. It will display some info on the tokens related to that process instance and the current nodes they are in.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/check_token_status.png)

In case more details are needed about the token, you can click the **Process status** view button, choose a token then click the **view button** again:

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/building-blocks/token_view_button.gif)

### Token status details

The following token details are available when you access and view the JSON file of a token in FLOWX Designer:

```json
id: 492952
version: 31
parentTokenId: null
currentNodeId: 491660
currentNodeName: null
state: "INACTIVE"
statusCurrentNode: "EXECUTED_COMPLETE"
syncNodeTokensCount: 0
syncNodeTokensFinished: 0
dateUpdated: "2022-05-18T09:57:58.639911Z"
paramValues: null
processInstanceId: 492902
currentNode: null
nodesActionStates:
   0: Object {"nodeId":491663,"name":"Start","arrivedDate":"2022-05-18T09:56:39.576753Z","actionStateData":null}
   1: Object {"nodeId":491657,"name":"stepper","arrivedDate":"2022-05-18T09:56:40.728676Z","actionStateData":null}
   2: Object {"nodeId":491656,"name":"step1","arrivedDate":"2022-05-18T09:56:41.053054Z","actionStateData":null}
   3: Object {"nodeId":491662,"name":"Client Form","arrivedDate":"2022-05-18T09:56:41.334506Z","actionStateData":{"492053":{"name":"saveClient","state":"COMPLETED","lastExecutedDate":"2022-05-18T09:57:22.648152Z"}}}
   4: Object {"nodeId":491664,"name":"end step1","arrivedDate":"2022-05-18T09:57:23.178718Z","actionStateData":null}
   5: Object {"nodeId":491661,"name":"step2","arrivedDate":"2022-05-18T09:57:23.375835Z","actionStateData":null}
   6: Object {"nodeId":491655,"name":"company form","arrivedDate":"2022-05-18T09:57:23.614491Z","actionStateData":{"492052":{"name":"SaveCompany","state":"COMPLETED","lastExecutedDate":"2022-05-18T09:57:56.671106Z"}}}
   7: Object {"nodeId":491658,"name":"stop step2","arrivedDate":"2022-05-18T09:57:57.032522Z","actionStateData":null}
   8: Object {"nodeId":491659,"name":"stop_stepper","arrivedDate":"2022-05-18T09:57:57.317008Z","actionStateData":null}
   9: Object {"nodeId":492452,"name":"CreateDocument","arrivedDate":"2022-05-18T09:57:57.724493Z","actionStateData":{"492102":{"name":"sendInformation","state":"COMPLETED","lastExecutedDate":"2022-05-18T09:57:57.764628Z"}}}
   10: Object {"nodeId":492453,"name":"ReceiveDocuments","arrivedDate":"2022-05-18T09:57:58.085271Z","actionStateData":null}
   11: Object {"nodeId":491660,"name":"end_process","arrivedDate":"2022-05-18T09:57:58.639921Z","actionStateData":null}
backSeq: Object {"nodes":[491663,491657,491656,491662,491664,491661,491655,491658,491659,492452,492453,491660]}
uuid: "794954a7-875f-4508-bbcb-8a11cf7a9b37"
```



| Token status details   | Examples/values                                                                                                                          | Definition                                                                                                                                                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                     | 492952                                                                                                                                   | id of the token                                                                                                                                                                                                              |
| version                | 31                                                                                                                                       | version of the token                                                                                                                                                                                                         |
| parentTokenId          | null                                                                                                                                     | id of the parent token                                                                                                                                                                                                       |
| currentNodeId          | 491660                                                                                                                                   | id of the current node                                                                                                                                                                                                       |
| state                  | `ACTIVE`, `ON_HOLD`, `INACTIVE`                                                                                                          | state of the token                                                                                                                                                                                                           |
| statusCurrentNode      | `ARRIVED`, `EXECUTING,EXECUTED_PARTIAL`, `EXECUTED_COMPLETE`,`WAITING_MESSAGE`, `MESSAGE RECEIVED`, `MESSAGE_RESPONSE_TIMED_OUT`         | status of the current node                                                                                                                                                                                                   |
| syncNodeTokensCount    | `syncNodeTokensCount: 0`                                                                                                                 | number of tokens that are created when reaching a [parallel gateway](./node/parallel-gateway.md)                                                                                                                   |
| syncNodeTokensFinished | `syncNodeTokensFinished: 0`                                                                                                              | how many tokens were executed in the parallel path, it is important to keep in mind that the close Parallel node, will wait for all branches to finish before moving to next node                                            |
| dateUpdated            | "2022-05-18T09:53:28.587930Z"                                                                                                            | date when the token was updated                                                                                                                                                                                              |
| processInstanceId      | 492902                                                                                                                                   | the id of the process instance                                                                                                                                                                                               |
| nodesActionStates      | <p><code>0: Object {"nodeId":491663,"name":"Start","arrivedDate":"2022-05-18T09:56:39.576753Z","actionStateData":null}</code></p><p></p> | actions that were added and executed on a node                                                                                                                                                                               |
| backSeq                | <pre><code>Object {"nodes":[491663,491657,491656,491662,491664,491661,491655,491658,491659,492452,492453,491660]}</code></pre>           | used for back in steps, it holds the node sequence until it reaches one node that could perform a back in and [move the token backwards](../flowx-designer/managing-a-process-flow/moving-a-token-backwards-in-a-process.md) |