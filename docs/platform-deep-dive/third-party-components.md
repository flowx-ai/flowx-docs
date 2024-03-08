# Third-party components

FLOWX.AI uses a number of third-party software components:

### Open-source

* [Keycloak](third-party-components.md#keycloak)
* [Kafka](third-party-components.md#kafka) / [ZooKeeper](third-party-components.md#zookeeper)
* [Jaeger](third-party-components.md#jaeger)
* [AKHQ](third-party-components.md#akhq)
* [PostgreSQL](third-party-components.md#postrgresql)
* [MongoDB](third-party-components.md#mongodb)
* [Redis](third-party-components.md#redis)
* [NGINX](third-party-components.md#nginx)
* [EFK (Elastic Search, Fluentd, Kibana)](third-party-components.md#efk-kibana-fluentd-elastic-search)
* [S3 (MinIO)](third-party-components.md#s3-minio)
* [RabbitMQ (for OCR plugin)](third-party-components.md#rabbitmq)

### Not open-source 

* [OracleDB](third-party-components.md#oracledb)

### Third-party open-source components supported/tested versions

:::info compatibility
FlowX.AI supports any version of the third-party components listed as prerequisites.

For optimal performance and reliability, our internal QA process validates new releases using specific versions as indicated in the provided table.
While exploring alternative versions that suit your company's specific requirements, we recommend referring to the compatibility matrix for guidance.

In the unlikely event that you encounter any compatibility issues with FlowX.AI, please open a support ticket [**here**](https://support.flowx.ai/), and our dedicated team will address and resolve any identified bugs following our standard support process.

Compatibility Matrix:

* FLOWX.AI Platform: Recommended and tested versions
* Third-Party Components: Supported versions based on specific requirements and client preferences
:::

| FLOWX.AI Platform Version | Component name               | Supported/tested versions    |
| ------------------------- | ---------------------------- | ---------------------------- |
| 2.3.0 → 3.4.3             | Keycloak                     | 18.0.x                       |
| 2.3.0 → 3.4.3             | Kafka / Zookeeper*           | 3.0.1 / 3.6.6                |
| 2.3.0 → 3.4.3             | Jaeger                       | 1.34.1                       |
| 2.3.0 → 3.4.3             | AKHQ                         | 0.17.0                       |
| 2.3.0 → 3.4.3             | PostgreSQL                   | 14.3.0                       |
| 2.3.0 → 3.4.3             | MongoDB                      | 5.0.8                        |
| 2.3.0 → 3.4.3             | Redis                        | 6.2.6                        |
| 2.3.0 → 3.4.3             | NGINX Ingress Controller     | 1.2.0                        |
| 2.3.0 → 3.4.3             | Elasticsearch                | 7.17                         |
| 2.3.0 → 3.4.3             | Fluentd                      | 3.3.0                        |
| 2.3.0 → 3.4.3             | Kibana                       | 7.17                         |
| 2.3.0 → 3.4.3             | S3 (Min.IO) / minio-operator | 2022-05-26T05-48-41Z / 4.5.4 |



### Third-party components supported/tested versions

| FLOWX.AI Platform version | Component name | Supported/tested versions |
| ------------------------- | -------------- | ------------------------- |
| 2.3.0 → 3.4.3             | OracleDB       | 12C / 18-XE               |


:::info
Since Kafka version 2.8, the self-managed (Kraft) mode is available alongside ZooKeeper. It was released as a preview feature in version 3.0. Finally, with several improvements, it has been declared production ready in version 3.3.1. Kafka may deprecate ZooKeeper in version 3.4. 
:::

### Summary

#### Keycloak

Keycloak is an open-source software product to allow single sign-on with Identity and Access Management aimed at modern applications and services.

[Keycloak documentation](https://www.keycloak.org/documentation)

#### **Kafka**

Apache Kafka is an open-source distributed event streaming platform that can handle a high volume of data and enables you to pass messages from one end-point to another.

Kafka is a unified platform for handling all the real-time data feeds. Kafka supports low latency message delivery and gives a guarantee for fault tolerance in the presence of machine failures. It has the ability to handle a large number of diverse consumers.

Kafka is very fast and performs 2 million writes/sec. Kafka persists all data to the disk, which essentially means that all the writes go to the page cache of the OS (RAM). This makes it very efficient to transfer data from a page cache to a network socket.

[Intro to Kafka](../platform-overview/frameworks-and-standards/event-driven-architecture-frameworks/intro-to-kafka-concepts.md)

[Kafka documentation](https://kafka.apache.org/documentation/)

#### ZooKeeper

ZooKeeper is a centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services. All of these kinds of services are used in some form or another by distributed applications.

[Zookeeper documentation](https://zookeeper.apache.org/documentation.html)

#### Jaeger

Jaeger is a popular open-source distributed tracing tool that is used to monitor and troubleshoot applications based on microservices architecture.

[Jaeger documentation](https://www.jaegertracing.io/docs/1.36/)

#### AKHQ

AKHQ is a tool used by FLOWX.AI to manage and display the data inside the Apache Kafka cluster.

[AKHQ documentation](https://akhq.io/docs/#installation)

#### PostrgreSQL

PostgreSQL, also known as Postgres, is a free and open-source relational database management system emphasizing extensibility and SQL compliance.

[PostgreSQL documentation](https://www.postgresql.org/docs/)

#### MongoDB

MongoDB is a source-available cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional [schemas](https://en.wikipedia.org/wiki/Database\_schema).

Used by FLOWX.AI to store business process data and configuration information on the core/plugin components.

[MongoDB documentation](https://www.mongodb.com/docs/)

#### Redis

Redis is a fast, open-source, in-memory key-value data store that is commonly used as a cache to store frequently accessed data in memory so that applications can be responsive to users.

It delivers sub-millisecond response times enabling millions of requests per second for applications.

It is also be used as a Pub/Sub messaging solution, allowing messages to be passed to channels and for all subscribers to that channel to receive that message. This feature enables information to flow quickly through the platform without using up space in the database as messages are not stored.

It is used by FLOWX.AI for caching the process definitions-related data.


[Intro to Redis](../platform-overview/frameworks-and-standards/event-driven-architecture-frameworks/intro-to-redis.md)


[Redis documentation](https://redis.io/docs/)

#### NGINX

Nginx Is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache.

FLOWX utilizes the Nginx engine as a load balancer and for routing the web traffic (API calls) from the SPA (single page application) to the backend service, to the engine, and to various plugins.

The FLOWX.AI Designer SPA will use the backend service to manage the platform via REST calls, will use API calls to manage specific content for the plugins, and will use REST and SSE calls to connect to the engine.


[Intro to NGINX](../platform-overview/frameworks-and-standards/event-driven-architecture-frameworks/intro-to-nginx.md)


[NGINX documentation](https://nginx.org/en/docs/)

#### EFK (Kibana, fluentd, Elastic Search)

Elasticsearch is a distributed, RESTful search and analytics engine capable of addressing a growing number of use cases.

As the heart of the Elastic Stack, it centrally stores your data for lightning-fast search, fine‑tuned relevancy, and powerful analytics that scale with ease.

Used by FLOWX.AI in the core component and optionally to allow searching for business process transaction data.

[Elastic stack documentation](https://www.elastic.co/elastic-stack/)

[Fluentd documentation](https://docs.fluentd.org/)

#### Kafka Connect Elasticsearch Service Sink

The Kafka Connect Elasticsearch Service Sink connector moves data from Apache Kafka® to Elasticsearch. It writes data from a topic in Kafka to an index in Elasticsearch. All data for a topic have the same type in Elasticsearch. This allows an independent evolution of schemas for data from different topics. This simplifies the schema evolution because Elasticsearch has one enforcement on mappings; that is, all fields with the same name in the same index must have the same mapping type.

#### S3 (MinIO)

FLOWX.AI uses [Min.IO](http://min.io/) as a cloud storage solution.

[MIN.IO documentation](https://min.io/)

[Docker available here](https://quay.io/repository/minio/minio?tab=tags&tag=RELEASE.2022-05-26T05-48-41Z)


#### Oracle DB

Oracle Database is a relational database management system (RDBMS).

[Oracle DB documentation](https://www.oracle.com/database/technologies/)

#### Superset

Apache Superset is a business intelligence web application. It helps users to explore and visualize their data, from simple pie charts to detailed dashboards.

[Superset](https://superset.apache.org/docs/intro)
