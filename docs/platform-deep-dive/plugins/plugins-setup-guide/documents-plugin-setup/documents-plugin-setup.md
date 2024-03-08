# Documents plugin setup

The Documents plugin provides functionality for generating, persisting, combining, and manipulating documents within the [**FLOWX.AI**](../../../../terms/flowx) system.

The plugin is available as a docker image.

## Dependencies

Before setting up the plugin, ensure that you have the following dependencies installed and configured:

* [PostgreSQL](https://www.postgresql.org/) Database: You will need a PostgreSQL database to store data related to document templates and documents.
* [MongoDB](https://www.mongodb.com/2) Database: MongoDB is required for the HTML templates feature of the plugin.
* Kafka: Establish a connection to the Kafka instance used by the FLOWX.AI engine.
* [Redis](https://redis.io/): Set up a Redis instance for caching purposes.
* S3-Compatible File Storage Solution: Deploy an S3-compatible file storage solution, such as [Min.io](https://min.io/), to store document files.

## Configuration

The plugin comes with pre-filled configuration properties, but you need to set up a few custom environment variables to tailor it to your specific setup. Here are the key configuration steps:

### Postgres database

Configure the basic Postgres settings in the `values.yaml` file:

```yaml
documentdb:
  existingSecret: {{secretName}}
  metrics:
    enabled: true
    service:
      annotations:
        prometheus.io/port: {{phrometeus port}}
        prometheus.io/scrape: "true"
      type: ClusterIP
    serviceMonitor:
      additionalLabels:
        release: prometheus-operator
      enabled: true
      interval: 30s
      scrapeTimeout: 10s
  persistence:
    enabled: true
    size: 4Gi
  postgresqlDatabase: document
  postgresqlUsername: postgres
  resources:
    limits:
      cpu: 500m
      memory: 512Mi
    requests:
      cpu: 200m
      memory: 256Mi
  service:
    annotations:
      fabric8.io/expose: "false"
```

### Redis server

The plugin can utilize the [Redis component](https://app.gitbook.com/@flowx-ai/s/flowx-docs/flowx-engine/setup-guide#2-redis-server) already deployed for the FLOWX.AI engine. Make sure it is configured properly.

### Document storage 

Ensure that you have a deployed S3-compatible file storage solution, such as Min.io, which will be used to store document files.

### Authorization configuration

To connect to the identity management platform, set the following environment variables:

* `SECURITY_OAUTH2_BASE_SERVER_URL`
* `SECURITY_OAUTH2_CLIENT_CLIENT_ID`
* `SECURITY_OAUTH2_REALM`

### Enable HTML template types 

If you want to use HTML templates for documents, set the `FLOWX_HTML_TEMPLATES_ENABLED` environment variable to true.

### Datasource configuration

The service uses a Postgres/Oracle database to store data related to document templates and documents. Configure the following details using environment variables:

* `SPRING_DATASOURCE_URL`: The URL for the Postgres/Oracle database.
* `SPRING_DATASOURCE_USERNAME`: The username for the database connection.
* `SPRING_DATASOURCE_PASSWORD`: The password for the database connection.
* `SPRING_JPA_PROPERTIES_HIBERNATE_DEFAULT_SCHEMA`: Use this property to overwrite the name of the database schema if needed.

Ensure that the user, password, connection URL, and database name are correctly configured to avoid startup errors. The datasource is automatically configured using a Liquibase script within the engine, including migration scripts.

### MongoDB configuration

Configure the MongoDB database access information by setting the `SPRING_DATA_MONGODB_URI` environment variable to the MongoDB database URI.

### Redis configuration

Set the following values with the corresponding Redis-related values:

* `SPRING_REDIS_HOST`: The host address of the Redis server.
* `SPRING_REDIS_PASSWORD`: The password for the Redis server, if applicable.
* `REDIS_TTL`: The time-to-live (TTL) value for Redis cache entries.

### Conversion

:::caution
Configuration available starting with **3.4.7** platform version.
:::

* `FLOWX_CONVERT_DPI`:	Sets the DPI (dots per inch) for PDF to JPEG conversion. Higher values result in higher resolution images. (Default value: `150`).

### Kafka configuration

Set the following Kafka-related configurations using environment variables:

* `SPRING_KAFKA_BOOTSTRAP_SERVERS`: The address of the Kafka server.
* `SPRING_KAFKA_CONSUMER_GROUP_ID`: The group ID for Kafka consumers.
* `KAFKA_CONSUMER_THREADS`: The number of Kafka consumer threads to use.
* `KAFKA_AUTH_EXCEPTION_RETRY_INTERVAL`: The interval between retries after a `AuthorizationException` is thrown by `KafkaConsumer`.
* `KAFKA_MESSAGE_MAX_BYTES`: The maximum size of a message that can be received by the broker from a producer.

Each action in the service corresponds to a Kafka event. Configure a separate Kafka topic for each use case.

#### Generate

* `KAFKA_TOPIC_DOCUMENT_GENERATE_HTML_IN`:This Kafka topic is used for messages related to generating HTML documents (the topic that listens for the request from the engine)
* `KAFKA_TOPIC_DOCUMENT_GENERATE_HTML_OUT`: This Kafka topic is used for messages related to generating HTML documents (the topic on which the engine will expect the reply)
* `KAFKA_TOPIC_DOCUMENT_GENERATE_PDF_IN`: This Kafka topic is used for the input messages related to generating PDF documents (the topic that listens for the request from the engine)
* `KAFKA_TOPIC_DOCUMENT_GENERATE_PDF_OUT`: This Kafka topic is used for the output messages related to generating PDF documents, it produces messages with the result of generating a PDF document (the topic on which the engine will expect the reply)


#### Persist (uploading a file/document)

* `KAFKA_TOPIC_FILE_PERSIST_IN`: This Kafka topic is used for the input messages related to persisting files, it receives messages indicating the request to persist a file (the topic that listens for the request from the engine)
* `KAFKA_TOPIC_FILE_PERSIST_OUT`: This Kafka topic is used for the output messages related to persisting files, it produces messages with the result of persisting a file (the topic on which the engine will expect the reply)
* `KAFKA_TOPIC_DOCUMENT_PERSIST_IN`: This Kafka topic is used for the input messages related to persisting documents, it receives messages indicating the request to persist a document (the topic that listens for the request from the engine)
* `KAFKA_TOPIC_DOCUMENT_PERSIST_OUT`: This Kafka topic is used for the output messages related to persisting documents, it produces messages with the result of persisting a document (the topic that listens for the request from the engine)

#### Split

* `KAFKA_TOPIC_DOCUMENT_SPLIT_IN`: This Kafka topic is used for the input messages related to splitting documents, it receives messages indicating the request to split a document into multiple parts (the topic that listens for the request from the engine)
* `KAFKA_TOPIC_DOCUMENT_SPLIT_OUT`: This Kafka topic is used for the output messages related to splitting documents, it produces messages with the result of splitting a document (the topic on which the engine will expect the reply)

#### Combine

* `KAFKA_TOPIC_FILE_COMBINE_IN`: This Kafka topic is used for the input messages related to combining files, it receives messages indicating the request to combine multiple files into a single file (the topic that listens for the request from the engine)
* `KAFKA_TOPIC_FILE_COMBINE_OUT`: This Kafka topic is used for the output messages related to combining files, it produces messages with the result of combining files (the topic on which the engine will expect the reply)


#### Get 

* `KAFKA_TOPIC_DOCUMENT_GET_URLS_IN`: This Kafka topic is used for the input messages related to retrieving URLs for documents, it receives messages indicating the request to retrieve the URLs of documents (the topic that listens for the request from the engine)
* `KAFKA_TOPIC_DOCUMENT_GET_URLS_OUT`: This Kafka topic is used for the output messages related to retrieving URLs for documents, it produces messages with the result of retrieving the URLs of documents (the topic on which the engine will expect the reply)

#### Delete

* `KAFKA_TOPIC_FILE_DELETE_IN`: This Kafka topic is used for the input messages related to deleting files, it receives messages indicating the request to delete a file (the topic that listens for the request from the engine)
* `KAFKA_TOPIC_FILE_DELETE_OUT`: This Kafka topic is used for the output messages related to deleting files, it produces messages with the result of deleting a file (the topic on which the engine will expect the reply)

#### OCR

* `KAFKA_TOPIC_OCR_OUT`: This Kafka topic is used for the output messages related to optical character recognition (OCR), it produces messages with the OCR results (the topic on which the engine will expect the reply)
* `KAFKA_TOPIC_OCR_IN`: This Kafka topic is used for the input messages related to optical character recognition (OCR), it receives messages indicating the request to perform OCR on a document (the topic that listens for the request from the engine)

:::caution
Ensure that the Engine is listening to messages on topics with specific patterns. Use the correct outgoing topic names when configuring the documents plugin.
:::

Each of these Kafka topics corresponds to a specific action or functionality within the service, allowing communication and data exchange between different components or services in a decoupled manner.

### File storage configuration

Depending on your use case, you can choose either a file system or an S3-compatible cloud storage solution for document storage. Configure the file storage solution using the following environment variables:

* `APPLICATION_FILE_STORAGE_S3_SERVER_URL`: The URL of the S3-compatible server.
* `APPLICATION_FILE_STORAGE_S3_ACCESS_KEY`: The access key for the S3-compatible server.
* `APPLICATION_FILE_STORAGE_S3_SECRET_KEY`: The secret key for the S3-compatible server.
* `APPLICATION_FILE_STORAGE_S3_BUCKET_PREFIX`: The prefix to use for S3 bucket names.
* `APPLICATION_FILESTORAGE_PARTITIONSTRATEGY`: Set the partition strategy for file storage. Use `NONE` to save documents in `minio/amazon-s3` as before, with a bucket for each process instance. Use `PROCESS_DATE` to save documents in a single bucket with a subfolder structure, for example: `bucket/2022/2022-07-04/process-id-xxxx/customer-id/file.pdf`.      
* `APPLICATION_FILE_STORAGE_S3_TEMP_BUCKET` - Upon file upload, the initial destination is a sandbox, from which it is subsequently transferred to the designated bucket.

:::info
Make sure to follow the recommended [bucket naming rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html) when choosing the bucket prefix name.
:::

### Setting maximum file size

To control the maximum file size permitted for uploads, configure the `SPRING_SERVLET_MULTIPART_MAX_FILE_SIZE` and `SPRING_SERVLET_MULTIPART_MAX_REQUEST_SIZE` variables.

:::info
The limit is set by default to 50MB:

```yml
spring:
  servlet:
    contextPath: /
    multipart:
      max-file-size: ${MULTIPART_MAX_FILE_SIZE:50MB}    #increase the multipart file size on the request
      max-request-size: ${MULTIPART_MAX_FILE_SIZE:50MB} #increase the request size
```
:::

### Custom font path for PDF templates

Set the `FLOWX_HTML_TEMPLATES_PDF_FONT_PATHS` config to select the font used for generating documents based on PDF templates.

### Custom font paths for PDF templates

If you want to use specific fonts in your PDF templates, override the `FLOWX_HTML_TEMPLATES_PDF_FONT_PATHS` config. By default, Calibri and DejaVuSans are available fonts.

After making these configurations, the fonts will be available for use within PDF templates.

### Logging

The following environment variables could be set in order to control log levels:

* `LOGGING_LEVEL_ROOT` - root spring boot microservice logs
* `LOGGING_LEVEL_APP` - app-level logs
* `LOGGING_LEVEL_MONGO_DRIVER` - MongoDB driver logs

Adjust these variables according to your logging requirements.
