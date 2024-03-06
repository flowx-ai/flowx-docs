# Setting up FLOWX Designer

**FLOWX Designer** is composed of a backend microservice (admin) and a frontend app. The admin part manages process-related entities and provides the REST API used by the [**FLOWX Designer**](../../terms/flowx-ai-designer). The processes defined here will be handled by the [FLOWX Engine](../../platform-deep-dive/core-components/flowx-engine.md).

To set up FLOWX Designer in your environment, follow these steps:

## **Prerequisites Management**

The backend microservice uses most of the same resources as the FLOWX Engine.

### Database - Postgres / Oracle

The backend microservice connects to the same Postgres / Oracle database as the Engine.

### Kafka cluster

If you intend to use the audit functionality, ensure that the backend microservice can connect to the Kafka cluster. When connected to Kafka, it sends details about all database transactions to a configured Kafka topic.

### NGINX

For optimal operation the FLOWX Designer should use a separate [NGINX](../../platform-overview/frameworks-and-standards/event-driven-architecture-frameworks/intro-to-nginx.md) load balancer from the [**Engine**](../../terms/flowxai-process-engine). This routing mechanism handles API calls from the [SPA](designer-setup-guide.md#for-configuring-the-spa) (single page application) to the backend service, to the engine and to various plugins.

Here's an example/suggestion of an NGINX setup:

#### For routing calls to plugins:

```jsx
metadata:
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/enable-cors: "true"
    nginx.ingress.kubernetes.io/cors-allow-methods: GET, PUT, POST, DELETE, PATCH
    nginx.ingress.kubernetes.io/cors-allow-origin: "http://localhost:4200,http://localhost:80,http://localhost:8080"
    nginx.ingress.kubernetes.io/rewrite-target: /$2
  name: flowx-admin-plugins-subpaths
spec:
  rules:
  - host: {{host}}
    http:
      paths:
      - path: /notification(/|$)(.*)
        backend:
          serviceName: notification
          servicePort: 80
      - path: /document(/|$)(.*)
        backend:
          serviceName: document
          servicePort: 80
  tls:
  - hosts:
    - {{host}}
    secretName: {{tls secret}}
```

#### For routing calls to the engine

Three different configurations are needed:

1. For viewing the current instances of processes running in the Engine:

```jsx
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/rewrite-target: /api/instances/$2
    nginx.ingress.kubernetes.io/enable-cors: "true"
    nginx.ingress.kubernetes.io/cors-allow-methods: GET, PUT, POST, DELETE, PATCH
    nginx.ingress.kubernetes.io/cors-allow-origin: "http://localhost:4200,http://localhost:80,http://localhost:8080"
  name: flowx-admin-engine-instances
spec:
  rules:
  - host: {{host}}
    http:
      paths:
      - path: /api/instances(/|$)(.*)
        backend:
          serviceName: {{engine-service-name}}
          servicePort: 80
```

2. For testing process definitions from the FLOWX Designer, route API calls and SSE communication to the Engine backend.

Setup for routing REST calls:

```jsx
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/rewrite-target: /api/$2
    nginx.ingress.kubernetes.io/enable-cors: "true"
    nginx.ingress.kubernetes.io/cors-allow-methods: GET, PUT, POST, DELETE, PATCH
    nginx.ingress.kubernetes.io/cors-allow-origin: "http://localhost:4200,http://localhost:80,http://localhost:8080"
  name: flowx-admin-engine-rest-api
spec:
  rules:
  - host: {{host}}
    http:
      paths:
      - path: /{{PROCESS_API_PATH}}/api(/|$)(.*)
        backend:
          serviceName: {{engine-service-name}}
          servicePort: 80
```

Setup for routing SSE communication:

```jsx
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/cors-allow-headers: "<your_defaultCorsAllowHeaders_value>"
  name: flowx-public-subpath-events-rewrite
spec:
  rules:
  - host: {{host}}
    http:
      paths:
      - backend:
          service:
            name: events-gateway
            port:
              name: http
        path: /api/events(/|$)(.*)
```

3. For accessing the REST API of the backend microservice

```jsx
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/proxy-body-size: "4m"
    nginx.ingress.kubernetes.io/enable-cors: "true"
    nginx.ingress.kubernetes.io/cors-allow-methods: GET, PUT, POST, DELETE, PATCH
    nginx.ingress.kubernetes.io/cors-allow-origin: "http://localhost:4200,http://localhost:80,http://localhost:8080"
  name: flowx-admin-api
spec:
  rules:
  - host: {{host}}
    http:
      paths:
        - path: /
          backend:
            serviceName: {{flowx-admin-service-name}}
            servicePort: 80
  tls:
  - hosts:
    - {{host}}
    secretName: {{tls secret}}
```

#### For configuring the SPA:

```jsx
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
    certmanager.k8s.io/issuer: letsencrypt-prod
    kubernetes.io/ingress.class: nginx
    ingress.kubernetes.io/affinity: cookie
  name: flowx-designer-spa
spec:
  rules:
  - host: {{host of web app}}
    http:
      paths:
      - backend:
          serviceName: {{flowx-designer-service-name}}
          servicePort: 80
  tls:
  - hosts:
    - {{host of web app}}
    secretName: {{tls secret}}
```

## **Admin configuration**

### Datasource configuration

To store process definitions the Admin microservice connects to the same Postgres / Oracle database as the Engine. Make sure to set the needed database connection details.

The following configuration details need to be added using environment variables:

* `SPRING_DATASOURCE_URL` - This environment variable is used to specify the URL of the database that the Admin microservice and Engine connect to. The URL typically includes the necessary information to connect to the database server, such as the host, port, and database name. It follows the format of the database's JDBC URL, which is specific to the type of database being used (e.g., PostgreSQL or Oracle).

* `SPRING_DATASOURCE_USERNAME` - This environment variable sets the username that the Admin microservice and Engine used to authenticate themselves when connecting to the database. The username is used to identify the user account that has access to the specified database.

* `SPRING_DATASOURCE_PASSWORD` - This environment variable specifies the password associated with the username provided in the `SPRING_DATASOURCE_USERNAME` variable. The password is used to authenticate the user and grant access to the database.

:::danger
You will need to make sure that the user, password, connection link and db name are configured correctly, otherwise, you will receive errors at start time.
:::

:::info
The database schema is managed by a [liquibase](https://www.liquibase.org/) script provided with the Engine.
:::

### Kafka configuration

[**Kafka**](../../terms/flowx-kafka) is used for saving audit logs and for using scheduled timer events. Only a producer needs to be configured. The environment variables that need to be set are:

* `KAFKA_BOOTSTRAP_SERVERS` - the Kafka bootstrap servers URL

* `KAFKA_TOPIC_AUDIT_OUT` - topic key for sending audit logs. Default value: `ai.flowx.audit.log`

* `KAFKA_TOPIC_PROCESS_START_FOR_EVENT_IN`

* `KAFKA_TOPIC_PROCESS_SCHEDULED_TIMER_EVENTS_OUT_SET`

* `KAFKA_TOPIC_PROCESS_SCHEDULED_TIMER_EVENTS_OUT_STOP`


### Redis configuration

The following values should be set with the corresponding Redis-related values:

* `SPRING_REDIS_HOST`

* `SPRING_REDIS_PASSWORD`

### Logging

The following environment variables could be set in order to control log levels:

* `LOGGING_LEVEL_ROOT` - root spring boot microservice logs

* `LOGGING_LEVEL_APP` - app level logs

### Authorization & access roles

The following variables need to be set in order to connect to the identity management platform:

* `SECURITY_OAUTH2_BASE_SERVER_URL`

* `SECURITY_OAUTH2_CLIENT_CLIENT_ID`

* `SECURITY_OAUTH2_REALM`

A specific service account should be configured in the OpenID provider to allow the Admin microservice to access realm-specific data. It can be configured using the following environment variables:

* `SECURITY_OAUTH2_SERVICE_ACCOUNT_ADMIN_CLIENT_ID` - the openid service account username

* `SECURITY_OAUTH2_SERVICE_ACCOUNT_ADMIN_CLIENT_SECRET` - the openid service account client secret

Configuration needed to clear the offline sessions of a user session from the identity provider solution:

* `FLOWX_AUTHENTICATE_CLIENTID` 

[Configuring access rights for admin](configuring-access-rights-for-admin)

### Elasticsearch

* `SPRING_ELASTICSEARCH_REST_URIS`

* `SPRING_ELASTICSEARCH_REST_DISABLESSL`

* `SPRING_ELASTICSEARCH_INDEX_SETTINGS_NAME` 

* `SPRING_ELASTICSEARCH_REST_USERNAME`

* `SPRING_ELASTICSEARCH_REST_PASSWORD`


### Undo/redo actions

```yaml
flowx:
	undo-redo:
	    ttl: 6000000   <---- redis ttl for undoable actions by user+nodeid (seconds)
	    cleanup:
	      cronExpression: 0 2 * * * * # every day at 2am   <---- when to run cleanup marked as deleted
	      days: 2   <----- marked as deleted will be deleted when older than days number
```

## **Steps to deploy Frontend app**

The FLOWX Designer is an SPA application that is packaged in a docker image with `nginx:1.19.10`. The web application allows an authenticated user to administrate the FLOWX platform.

In order to configure the docker image you need to configure the next parameters:

```jsx
flowx-process-renderer:
  env:
    BASE_API_URL: {{the one configured as host in the nginx}}
    PROCESS_API_PATH: {{something like /engine}}
    KEYCLOAK_ISSUER: {{openid provider - ex: https://something/auth/realms/realmName}}
    KEYCLOAK_REDIRECT_URI: {{url of the SPA}}
    KEYCLOAK_CLIENT_ID: {{client ID}}
    STATIC_ASSETS_PATH: {{mediaLibrary.s3.publicUrl }}/{{env}}
```

