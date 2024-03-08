# Notification templates plugin setup

The Notifications plugin is available as a docker image, and it has the following dependencies:

* a [MongoDB](https://www.mongodb.com/2) database
* needs to be able to connect to the Kafka instance used by the engine
* a [Redis](https://redis.io/) instance for caching notification templates
* in case you need to also attach documents to the sent notifications, the plugin will need to be able to access your chosen storage solution. It can use an S3 compatible file storage solution (we have successfully used [Min.io](https://min.io/))

The plugin comes with most of the needed configuration properties filled in, but there are a few that need to be set up using some custom environment variables.

## Dependencies 

### Mongo database

Basic mongo configuration - helm values.yaml

```yaml
notification-mdb:
    existingSecret: {{secretName}}
    mongodbDatabase: {{NotificationDatabaseName}}
    mongodbUsername: {{NotificationDatabaseUser}}
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

The plugin can use the [Redis component](https://app.gitbook.com/@flowx-ai/s/flowx-docs/flowx-engine/setup-guide#2-redis-server) already deployed for the engine.

### Document storage <a href="#4ea81105-00b4-4bf4-95f9-a55d87ea7b61" id="4ea81105-00b4-4bf4-95f9-a55d87ea7b61"></a>

You need to have an S3 compatible file storage solution deployed in your setup.

## Configuration <a href="#bad24571-ff23-4ec3-83d9-8a2ace74a6b4" id="bad24571-ff23-4ec3-83d9-8a2ace74a6b4"></a>

### Authorization configuration

The following variables need to be set in order to connect to the identity management platform:

`SECURITY_OAUTH2_BASE_SERVER_URL`

`SECURITY_OAUTH2_CLIENT_CLIENT_ID`

`SECURITY_OAUTH2_CLIENT_CLIENT_SECRET`

`SECURITY_OAUTH2_REALM`

### MongoDB configuration

The only thing that needs to be configured is the DB access info, the rest will be handled by the plugin.

`SPRING_DATA_MONGODB_URI` - the URI for the MongoDB database

### Redis configuration

The following values should be set with the corresponding Redis related values.

`SPRING_REDIS_HOST`

`SPRING_REDIS_PASSWORD`

`REDIS_TTL`

### Kafka configuration 

The following Kafka related configurations can be set by using environment variables:

`SPRING_KAFKA_BOOTSTRAP_SERVERS` - address of the Kafka server

`SPRING_KAFKA_CONSUMER_GROUP_ID` - group of consumers

`KAFKA_CONSUMER_THREADS` - the number of Kafka consumer threads

`KAFKA_AUTH_EXCEPTION_RETRY_INTERVAL` - the interval between retries after `AuthorizationException` is thrown by `KafkaConsumer`

`KAFKA_MESSAGE_MAX_BYTES` - this is the largest size of the message that can be received by the broker from a producer.

Each action available in the service corresponds to a Kafka event. A separate Kafka topic must be configured for each use-case.

#### **Forwarding notifications to an external system**

`KAFKA_TOPIC_NOTIFICATION_EXTERNAL_OUT` - the notification will be forwarded on this topic to be handled by an external system

#### **Sending a notification**

`KAFKA_TOPIC_NOTIFICATION_INTERNAL_IN` - topic used to trigger the request to send a notification

`KAFKA_TOPIC_NOTIFICATION_INTERNAL_OUT` - topic used for sending replies after sending the notification

#### **Generating/validating an OTP**

`KAFKA_TOPIC_OTP_GENERATE_IN`

`KAFKA_TOPIC_OTP_GENERATE_OUT` - after the OTP was generated and send to the user, this is the topic used to send the response back to the Engine.

`KAFKA_TOPIC_OTP_VALIDATE_IN` - Event send on this topic with an OTP and an identifier will check if the OTP is valid

`KAFKA_TOPIC_OTP_VALIDATE_OUT` - Response to the request to validate an OTP will be sent back to the Engine on this topic

:::caution
The Engine is listening for messages on topics with names of a certain pattern, make sure to use correct outgoing topic names when configuring the notifications plugin.
:::

### File storage configuration

Based on use case you can use directly a file system or an S3 compatible cloud storage solution (for example [min.io](http://min.io/)).

The file storage solution can be configured using the following environment variables:

`APPLICATION_FILE_STORAGE_S3_SERVER_URL`

`APPLICATION_FILE_STORAGE_S3_ACCESS_KEY`

`APPLICATION_FILE_STORAGE_S3_SECRET_KEY`

`APPLICATION_FILE_STORAGE_S3_BUCKET_PREFIX`

### SMTP Setup

If you want to use a custom SMTP server:

`SIMPLEJAVAMAIL_SMTP_HOST` - used by mail servers to send, receive, and/or relay outgoing mail between email senders and receivers

`SIMPLEJAVAMAIL_SMTP_PORT` - refers to the specific part of the Internet address that’s used to transfer email

`SIMPLEJAVAMAIL_SMTP_USERNAME`

`SIMPLEJAVAMAIL_SMTP_PASSWORD`

`SIMPLEJAVAEMAIL_TRANSPORTSTRATEGY` - sets the method on how the notifications are delivered, for example `EXTERNAL_FORWARD` for forwarding to external adapters

The email and name to be used as sender for emails sent by the plugin:

`APPLICATION_MAIL_FROM_EMAIL`

`APPLICATION_MAIL_FROM_NAME`

### Email attachments configuration

The maximum file size for files to be attached as email attachments can also be configured:

`SPRING_HTTP_MULTIPART_MAX_FILE_SIZE`

`SPRING_HTTP_MULTIPART_MAX_REQUEST_SIZE`

<!--
### Firebase push notifications configuration

We use [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging) for sending push notifications to mobile devices. If you want to use the feature of sending push notifications, it needs to be enabled by setting the A`PPLICATION_FIREBASE_PUSH_NOTIFICATIONS_ENABLED` environment variable to true.

Also, some setup is needed in your [Firebase Console](https://console.firebase.google.com) account:

* create a new project
* register each mobile app and download their respective config files and include them in the apps
* you will need to configure [a new service account ](https://firebase.google.com/docs/admin/setup#set-up-project-and-service-account)in your firebase account and download the service account JSON file and add the path to it in the plugin configuration:

`APPLICATION_FIREBASE_CONFIG_FILE`

-->

### OTP Configuration

The desired character size and expiration time of the generated one-time-passwords can also be configured.

`FLOWX_OTP_LENGTH` - the number of characters allowed for OTP

`FLOWX_OTP_EXPIRE_TIME_IN_SECONDS` - expiry time (seconds)

### Logging

The following environment variables could be set in order to control log levels:

`LOGGING_LEVEL_ROOT` - root spring boot microservice logs

`LOGGING_LEVEL_APP` - app level logs

`LOGGING_LEVEL_MONGO_DRIVER` - MongoDB driver logs

`LOGGING_LEVEL_THYMELEAF` - [Thymeleaf](https://www.thymeleaf.org/) logs, logs related to using notifications templates

<!--
`LOGGING_LEVEL_FCM_CLIENT` - Google API client logs, related to sending push notifications using Firebase
-->

### Error handling

`KAFKA_CONSUMER_ERROR_HANDLING_ENABLED`- default value: `FALSE`→ allows control on Kafka consumer applications to handle errors and failures during message consumption - When this variable is set to `true`, it enables the consumer application to handle any errors that occur during message consumption

`KAFKA_CONSUMER_ERROR_HANDLING_RETRIES`- default value: `0`→ when `KAFKA_CONSUMER_ERROR_HANDLING_ENABLED` is set to `true`, this environment variable specifies the maximum number of retries that the consumer application should attempt before giving up on processing a message; for example, if `KAFKA_CONSUMER_ERROR_HANDLING_RETRIES` is set to `5`, the consumer application will attempt to process a message up to 5 times before giving up

`KAFKA_CONSUMER_ERROR_HANDLING_RETRY_INTERVAL`- default value: `1000`→ when `KAFKA_CONSUMER_ERROR_HANDLING_ENABLED` is set to true and retries are enabled with `KAFKA_CONSUMER_ERROR_HANDLING_RETRIES`, this environment variable specifies the amount of time that the consumer application should wait before attempting to retry processing a message

:::info
For example, if KAFKA_CONSUMER_ERROR_HANDLING_RETRY_INTERVAL is set to 5 seconds, the consumer application will wait 5 seconds before attempting to retry processing a failed message. This interval is applied to all retry attempts, so if KAFKA_CONSUMER_ERROR_HANDLING_RETRIES is set to 5 and the retry interval is 5 seconds, the consumer application will make up to 5 attempts, waiting 5 seconds between each attempt.
:::

