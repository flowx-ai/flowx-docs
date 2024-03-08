# Task Manager plugin setup

The plugin is available as a docker image.

It has the following dependencies:

* a [mongodb](https://www.mongodb.com/2) database
* needs to be able to connect to the DB used by the engine
* needs to be able to connect to the Kafka instance used by the engine
* a [redis](https://redis.io/) instance for caching

The plugin comes with most of the needed configuration properties filled in, but there are a few that need to be set up using some custom environment variables.

## Dependencies 

### **Mongo database**

Basic mongo configuration - helm values.yaml

```yaml
notification-mdb:
    existingSecret: {{secretName}}
    mongodbDatabase: {{TaskManagementDatabaseName}}
    mongodbUsername: {{TaskManagementDatabaseUser}}
    persistence:
      enabled: true
      mountPath: /bitnami/mongodb
      size: 4Gi
    replicaSet:
      enabled: true
      name: rs0
      pdb:
        enabled: true
        minAvailable:
          arbiter: 1
          secondary: 1
      replicas:
        arbiter: 1
        secondary: 1
      useHostnames: true
    serviceAccount:
      create: false
    usePassword: true
```

### Redis server

The plugin can use the [Redis component](../../../../platform-setup-guides/platform-setup-guides-docs.md#redis-configuration) already deployed for the engine.

## Configuration 

## Authorization configuration & access roles

The following variables need to be set in order to connect to the identity management platform:

`SECURITY_OAUTH2_BASE_SERVER_URL`

`SECURITY_OAUTH2_CLIENT_CLIENT_ID`

`SECURITY_OAUTH2_CLIENT_CLIENT_SECRET`

`SECURITY_OAUTH2_REALM`



A specific service account should be configured in the OpenID provider to allow the Task management microservice to access realm specific data. It can be configured using the following environment variables:

`SECURITY_OAUTH2_SERVICE_ACCOUNT_ADMIN_CLIENT_ID` - the openid service account username

`SECURITY_OAUTH2_SERVICE_ACCOUNT_ADMIN_CLIENT_SECRET` - the openid service account client secret

### Engine datasource configuration

The service needs to retrieve the data for a process instance from the engine database. So it needs to have all the correct information to connect to the engine database.

The following configuration details need to be added in configuration files or overwritten using environment variables:

`SPRING_DATASOURCE_URL`

`SPRING_DATASOURCE_USERNAME`

`SPRING_DATASOURCE_PASSWORD`

### MongoDB configuration

The only thing that needs to be configured is the DB access info, the rest will be handled by the plugin.

`SPRING_DATA_MONGODB_URI` - the uri for the mongodb database

### Redis configuration

The following values should be set with the corresponding Redis related values.

`SPRING_REDIS_HOST`

`SPRING_REDIS_PASSWORD`

`REDIS_TTL`


## Kafka configuration

The following Kafka related configurations can be set by using environment variables:

`SPRING_KAFKA_BOOTSTRAP_SERVERS` - address of the Kafka server

`SPRING_KAFKA_CONSUMER_GROUP_ID` - group of consumers

`KAFKA_CONSUMER_THREADS` - the number of Kafka consumer threads

`KAFKA_CONSUMER_EXCLUDE_USERS_THREADS` - 

`KAFKA_AUTH_EXCEPTION_RETRY_INTERVAL` - the interval between retries after `AuthorizationException` is thrown by `KafkaConsumer`

`KAFKA_MESSAGE_MAX_BYTES` - this is the largest size of the message that can be received by the broker from a producer.

### Kafka topics

Each action available in the service corresponds to a Kafka event. A separate Kafka topic must be configured for each use-case:

`KAFKA_TOPIC_PROCESS_START_OUT` - is used for running hooks, the engine receives a start process request for a hook on this topic, and it needs to be matched with the corresponding `...start_in` topic on the engine side

`KAFKA_TOPIC_PROCESS_OPERATIONS_OUT`- is used to update the engine on task manager operations such as assignment, unassignment, hold, unhold and terminate it is matched with the `...operations_in` topic on the engine side

`KAFKA_TOPIC_PROCESS_SCHEDULE_IN`- is used to receive a message from the task manager when it's time to run a hook (for hooks configured with SLA, for more details on how to configure a hook with SLA, click [here](../../custom-plugins/task-management/using-hooks.md#types-of-hooks))

`KAFKA_TOPIC_PROCESS_SCHEDULE_OUT_SET`- sends a message to the scheduler to set hooks or exclude users from automatic assignment when they are assigned to [out of office feature](../../custom-plugins/task-management/using-out-of-office-records.md), it needs to be matched with the configuration in the scheduler

`KAFKA_TOPIC_PROCESS_SCHEDULE_OUT_STOP`- ends a message to the scheduler to stop the schedule for the above actions. It needs to be matched with the configuration in the scheduler

`KAFKA_TOPIC_EXCLUDE_USERS_SCHEDULE_IN`- is used to receive a message from the scheduler when users need to be excluded

`KAFKA_TOPIC_TASK_IN`- used to receive a message from the engine to start a new task. It needs to be matched with the corresponding task_out topic on the engine side.

`KAFKA_TOPIC_EVENTS_GATEWAY_OUT_MESSAGE` - outgoing messages for Events Gateway

:::caution
The Engine is listening for messages on topics with names of a certain pattern, make sure to use correct outgoing topic names when configuring the notifications plugin.
:::


### Logging

The following environment variables could be set in order to control log levels:

`LOGGING_LEVEL_ROOT` - root spring boot microservice logs

`LOGGING_LEVEL_APP` - app level logs

`LOGGING_LEVEL_MONGO_DRIVER` - MongoDB driver logs

### Filtering

`FLOWX_ALLOW_USERNAME_SEARCH_PARTIAL` - filter possible assignees by partial names (default: true)

