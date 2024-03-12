# Advancing Controller setup guide

This guide provides step-by-step instructions to help you configure and deploy the Advancing Controller effectively.

## Infrastructure prerequisites

Advancing controller requires the following components to be set up before it can be started:

* **FLOWX.AI Engine deployment** - the Advancing Controller is dependent on the FLOWX.AI Engine and must be deployed in the same environment, refer to the FLOWX.AI Engine setup guide for more information on how to set up the Engine
* **DB instance** - the Advancing Controller uses a PostgreSQL or OracleDB as database instance


## Dependencies

* [Database](#database-configuration)
* [Datasource](#configuring-datasource)
* [FLOWX.AI Engine](./flowx-engine-setup-guide.md)

### Database configuration

#### Postgres

A basic Postgres configuration for Advancing:

```yaml
postgresql:
  enabled: true
  postgresqlUsername: "postgres"
  postgresqlPassword: ""
  postgresqlDatabase: "advancing"
  existingSecret: "postgresql-generic"
  postgresqlMaxConnections: 200
  persistence:
    enabled: true
    storageClass: standard-rwo
    size: 20Gi
  resources:
    limits:
      cpu: 1000m
      memory: 1024Mi
    requests:
      memory: 256Mi
      cpu: 100m
  metrics:
    enabled: true
    serviceMonitor:
      enabled: false
    prometheusRule:
      enabled: false
  primary:
    nodeSelector:
      preemptible: "false"

```

:::caution
If the parallel advancing configuration already exists, resetting the 'advancing' database must be done by executing the SQL command `DROP DATABASE advancing;`. Once the database has been dropped, the Liquibase script will automatically re-enable it.
:::

## Configuration

The following configuration details need to be added using environment variables:

Advancing controller uses a PostgreSQL or an Oracle database as a dependency.

* the user, password, connection link, and database name need to be configured correctly, if these details are not configured correctly, errors will occur at startup
* the datasource is configured automatically via a Liquibase script inside the engine. All updates will include migration scripts.

### Configuring datasource

The following configuration details need to be added using environment variables:

* `SPRING_DATASOURCE_URL` - environment variable used to configure a data source URL for a Spring application, it typically contains the JDBC driver name, the server name, port number, and database name

* `SPRING_DATASOURCE_USERNAME` - environment variable used to set the username for the database connection, this can be used to connect to a database instance


* `SPRING_DATASOURCE_PASSWORD` - environment variable used to store the password for the database connection, this can be used to secure access to the database and ensure that only authorized users have access to the data

* `SPRING_JPA_DATABASE` - relevant because it is used to specify the type of database that the Spring application should connect to (accepted values: `oracle` or `postgresql`)

* `SPRING_JPA_PROPERTIES_HIBERNATE_DEFAULTSCHEMA` (❗️only for Oracle DBs) - dpecifies the default schema to use for the database (default value: `public`)

You will need to make sure that the user, password, connection link and db name are configured correctly, otherwise, you will receive errors at start time.

:::caution
It's important to keep in mind that the Advancing Controller is tightly integrated with the FLOWX.AI Engine. Therefore, it is important to ensure that both the Engine and the Advancing Controller are configured correctly and are in sync.
:::

