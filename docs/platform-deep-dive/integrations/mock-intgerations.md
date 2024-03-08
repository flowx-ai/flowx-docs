# Mock integrations

If you need to test the business process flow but haven't completed all integrations, you can still do so by utilizing the mock integrations server included in the platform.

## Setup

To begin, configure the microservice's DB settings to use a Postgres DB. Then, deploy the mocked adapter microservice.

## Adding a new integration

Setting up a mocked integration requires only one step: adding a mock Kafka request and response.

You have two options for accomplishing this:

1. Add the information directly to the DB.
2. Use the provided API.

For each Kafka message exchange between the engine and the integration, you need to create a separate entry.

<details>
<summary><span class="postcall"><b>POST</b></span><b> MOCK_ADAPTER_URL/api/kafka-exchanges/ </b></summary>

**Add new Kafka exchange mock**

**Parameters**

**Body**

* `sentMessageJson` (string) - the mocked JSON message that the integration will send
* `receivedMessageJson` (string) - the JSON message the integration should reply with
* `outgoingTopic` (string) - should match the topic the engine listens on for replies from the integration
* `incomingTopic` (string) - should match the topic name that the integration listens on

**Responses**

200 - returns the newly added Kafka exchange

</details>


<details>
<summary><span class="getcall"><b>GET</b></span><b> MOCK_ADAPTER_URL/api/kafka-exchanges/ </b></summary>

**View all available Kafka exchanges**

Retrieves the complete list of all available mocked Kafka exchange messages.

**Parameters**

**Path**

string

**Responses**

200 

</details>