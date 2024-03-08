# Reporting setup

## Introduction

The Reporting Setup Guide assists in configuring the reporting plugin, relying on specific dependencies and configurations.

## Dependencies

The reporting plugin, available as a Docker image, requires the following dependencies:

- **PostgreSQL**: Dedicated instance for reporting data storage.
- **Reporting-plugin Helm Chart**:
  - Utilizes a Spark Application to extract data from the FLOWX.AI Engine database and populate the Reporting plugin database.
  - Utilizes Spark Operator (more info [**here**](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator/blob/master/docs/quick-start-guide.md)).
- **Superset**:
  - Requires a dedicated PostgreSQL database for its operation.
  - Utilizes Redis for efficient caching.
  - Exposes its user interface via an ingress.

## Reporting plugin helm chart configuration

Configuring the reporting plugin involves several steps:

### Installation of Spark Operator

1. Install the Spark Operator using Helm:

```bash
helm install local-spark-release spark-operator/spark-operator \
--namespace spark-operator --create-namespace \
--set webhook.enable=true \
--set logLevel=6
```

2. Apply RBAC configurations:

```bash
kubectl apply -f spark-rbac.yaml
```
3. Build the reporting image:

```bash
docker build ...
```

4. Update the `reporting-image` URL in the `spark-app.yml` file.

5. Configure the correct database ENV variables in the `spark-app.yml` file (check them in the above examples with/without webhook).

6. Deploy the application:

```bash
kubectl apply -f operator/spark-app.yaml
```

## Spark Operator deployment options

### Without webhook

For deployments without a webhook, manage secrets and environmental variables for security:

```yaml
sparkApplication: #Defines the Spark application configuration.
  enabled: "true" #Indicates that the Spark application is enabled for deployment.
  schedule: "@every 5m" #A cronJob that should run at every 5 minutes.
  driver: # This section configures the driver component of the Spark application.
    envVars: #Environment variables for driver setup.
      ENGINE_DATABASE_USER: flowx
      ENGINE_DATABASE_URL: postgresql:5432
      ENGINE_DATABASE_NAME: process_engine
      ENGINE_DATABASE_TYPE: postgres # To set the type of engine database, can be also changed to oracle
      REPORTING_DATABASE_USER: flowx
      REPORTING_DATABASE_URL: postgresql:5432
      REPORTING_DATABASE_NAME: reporting
      ENGINE_DATABASE_PASSWORD: "password"
      REPORTING_DATABASE_PASSWORD: "password"
  executor: #This section configures the executor component of the Spark application.
    envVars: #Environment variables for executor setup.
      ENGINE_DATABASE_USER: flowx
      ENGINE_DATABASE_URL: postgresql:5432
      ENGINE_DATABASE_NAME: process_engine
      ENGINE_DATABASE_TYPE: postgres # To set the type of engine database, can be also changed to oracle
      REPORTING_DATABASE_USER: flowx
      REPORTING_DATABASE_URL: postgresql:5432
      REPORTING_DATABASE_NAME: reporting
      ENGINE_DATABASE_PASSWORD: "password"
      REPORTING_DATABASE_PASSWORD: "password"
```
:::info
Note: Passwords are currently set as plain strings, which is not secure practice in a production environment.
:::

### With webhook

When using the webhook, employ environmental variables with secrets for a balanced security approach:


```yaml
sparkApplication:
  enabled: "true"
  schedule: "@every 5m"
  driver:
    env: #Environment variables for driver setup with secrets.
      ENGINE_DATABASE_USER: flowx
      ENGINE_DATABASE_URL: postgresql:5432
      ENGINE_DATABASE_NAME: process_engine
      ENGINE_DATABASE_TYPE: postgres # To set the type of engine database, can be also changed to oracle     
      REPORTING_DATABASE_USER: flowx
      REPORTING_DATABASE_URL: postgresql:5432
      REPORTING_DATABASE_NAME: reporting
    extraEnvVarsMultipleSecretsCustomKeys: 
      - name: postgresql-generic
        secrets: #Secrets retrieved from a generic source.
          ENGINE_DATABASE_PASSWORD: postgresql-password
          REPORTING_DATABASE_PASSWORD: postgresql-password
  executor:
    env: #Environment variables for executor setup with secrets.
      ENGINE_DATABASE_USER: flowx
      ENGINE_DATABASE_URL: postgresql:5432
      ENGINE_DATABASE_NAME: process_engine
      ENGINE_DATABASE_TYPE: postgres # To set the type of engine database, can be also changed to oracle
      REPORTING_DATABASE_USER: flowx
      REPORTING_DATABASE_URL: postgresql:5432
      REPORTING_DATABASE_NAME: reporting
    extraEnvVarsMultipleSecretsCustomKeys:
      - name: postgresql-generic
        secrets: #Secrets retrieved from a generic source.
          ENGINE_DATABASE_PASSWORD: postgresql-password
          REPORTING_DATABASE_PASSWORD: postgresql-password
```


:::info
In Kubernetes-based Spark deployments managed by the Spark Operator, you can define the sparkApplication configuration to customize the behavior, resources, and environment for both the driver and executor components of Spark jobs. The driver section allows fine-tuning of parameters specifically pertinent to the driver part of the Spark application.
:::

Below are the configurable values within the chart values.yml file (with webhook):

```yml
apiVersion: "sparkoperator.k8s.io/v1beta2"
kind: ScheduledSparkApplication
metadata:
  name: reporting-plugin-spark-app
  namespace: dev
  labels:
    app.kubernetes.io/component: reporting
    app.kubernetes.io/instance: reporting-plugin
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: reporting-plugin
    app.kubernetes.io/release: 0.0.1-FLOWXRELEASE
    app.kubernetes.io/version: 0.0.1-FLOWXVERSION
    helm.sh/chart: reporting-plugin-0.1.1-PR-9-4-20231122153650-e
spec:
  schedule: '@every 5m'
  concurrencyPolicy: Forbid
  template:
    type: Python
    pythonVersion: "3"
    mode: cluster
    image: eu.gcr.io/prj-cicd-d-flowxai-jx-6401/reporting-plugin:0.1.1-PR-9-4-20231122153650-eb6c
    imagePullPolicy: IfNotPresent
    mainApplicationFile: local:///opt/spark/work-dir/main.py
    sparkVersion: "3.1.1"
    restartPolicy:
      type: Never
      onFailureRetries: 0
      onFailureRetryInterval: 10
      onSubmissionFailureRetries: 5
      onSubmissionFailureRetryInterval: 20
    driver:
      cores: 1
      coreLimit: 1200m
      memory: 512m
      labels:
        version: 3.1.1
      serviceAccount: spark
      env:
        ENGINE_DATABASE_USER: flowx
        ENGINE_DATABASE_URL: postgresql:5432
        ENGINE_DATABASE_NAME: process_engine
        ENGINE_DATABASE_TYPE: postgres # To set the type of engine database, can be also changed to oracle
        REPORTING_DATABASE_USER: flowx
        REPORTING_DATABASE_URL: postgresql:5432
        REPORTING_DATABASE_NAME: reporting
        ENGINE_DATABASE_PASSWORD: "password"
        REPORTING_DATABASE_PASSWORD: "password"
    extraEnvVarsMultipleSecretsCustomKeys: 
      - name: postgresql-generic
        secrets: #Secrets retrieved from a generic source.
          ENGINE_DATABASE_PASSWORD: postgresql-password
          REPORTING_DATABASE_PASSWORD: postgresql-password
    executor:
      cores:  1
      instances: 3
      memory: 512m
      labels:
        version: 3.1.1
      env: #Environment variables for executor setup with secrets.
        ENGINE_DATABASE_USER: flowx
        ENGINE_DATABASE_URL: postgresql:5432
        ENGINE_DATABASE_NAME: process_engine
        ENGINE_DATABASE_TYPE: postgres # To set the type of engine database, can be also changed to oracle
        REPORTING_DATABASE_USER: flowx
        REPORTING_DATABASE_URL: postgresql:5432
        REPORTING_DATABASE_NAME: reporting
    extraEnvVarsMultipleSecretsCustomKeys:
      - name: postgresql-generic
        secrets: #Secrets retrieved from a generic source.
          ENGINE_DATABASE_PASSWORD: postgresql-password
          REPORTING_DATABASE_PASSWORD: postgresql-password
```

### Superset configuration

Detailed Superset Configuration Guide:

[Superset configuration](https://github.com/apache/superset/blob/master/helm/superset/README.md)

Refer to Superset Documentation for in-depth information:

[Superset documentation](https://superset.apache.org/docs/intro/)

## Post-installation steps

After installation, perform the following essential configurations:

### Datasource configuration

For document-related data storage, configure these environment variables:

* `SPRING_DATASOURCE_URL`
* `SPRING_DATASOURCE_USERNAME`
* `SPRING_DATASOURCE_PASSWORD`

Ensure accurate details to prevent startup errors. The Liquibase script manages schema and migrations.

### Redis configuration

The following values should be set with the corresponding Redis-related values:

* `SPRING_REDIS_HOST`
* `SPRING_REDIS_PORT`

## Keycloak configuration


To implement alternative user authentication:

* Override `AUTH_TYPE` in your `superset.yml` configuration file:
  * Set `AUTH_TYPE: AUTH_OID`
* Provide the reference to your `openid-connect` realm:
  * `OIDC_OPENID_REALM: 'flowx'`

With this configuration, the login page changes to a prompt where the user can select the desired OpenID provider.

### Extend the security manager

Firstly, you will want to make sure that flask stops using `flask-openid` and starts using `flask-oidc` instead. 

To do so, you will need to create your own security manager that configures `flask-oidc` as its authentication provider. 

```yml
extraSecrets:
  keycloak_security_manager.py: |
    from flask_appbuilder.security.manager import AUTH_OID
    from superset.security import SupersetSecurityManager
    from flask_oidc import OpenIDConnect
```
To enable OpenID in Superset, you would previously have had to set the authentication type to `AUTH_OID`.

The security manager still executes all the behavior of the super class, but overrides the OID attribute with the `OpenIDConnect` object. 

Further, it replaces the default OpenID authentication view with a custom one:

```yml
    from flask_appbuilder.security.views import AuthOIDView
    from flask_login import login_user
    from urllib.parse import quote
    from flask_appbuilder.views import expose
    from flask import request, redirect

    class AuthOIDCView(AuthOIDView):
        @expose('/login/', methods=['GET', 'POST'])
        def login(self, flag=True):
            sm = self.appbuilder.sm
            oidc = sm.oid
            superset_roles = ["Admin", "Alpha", "Gamma", "Public", "granter", "sql_lab"]
            default_role = "Admin"
            @self.appbuilder.sm.oid.require_login
            def handle_login():
                user = sm.auth_user_oid(oidc.user_getfield('email'))
                if user is None:
                    info = oidc.user_getinfo(['preferred_username', 'given_name', 'family_name', 'email', 'roles'])
                    roles = [role for role in superset_roles if role in info.get('roles', [])]
                    roles += [default_role, ] if not roles else []
                    user = sm.add_user(info.get('preferred_username'), info.get('given_name', ''), info.get('family_name', ''),
                                       info.get('email'), [sm.find_role(role) for role in roles])
                login_user(user, remember=False)
                return redirect(self.appbuilder.get_url_for_index)
            return handle_login()
        @expose('/logout/', methods=['GET', 'POST'])
        def logout(self):
            oidc = self.appbuilder.sm.oid
            oidc.logout()
            super(AuthOIDCView, self).logout()
            redirect_url = request.url_root.strip('/')
            # redirect_url = request.url_root.strip('/') + self.appbuilder.get_url_for_login
            return redirect(
                oidc.client_secrets.get('issuer') + '/protocol/openid-connect/logout?redirect_uri=' + quote(redirect_url))
```

On authentication, the user is redirected back to Superset. 

### Configure Superset authentication

Finally, we need to add some parameters to the superset .yml file:

```yml
    '''
    ---------------------------KEYCLOACK ----------------------------
    '''
    curr  =  os.path.abspath(os.getcwd())
    AUTH_TYPE = AUTH_OID
    OIDC_CLIENT_SECRETS =  curr + '/pythonpath/client_secret.json'
    OIDC_ID_TOKEN_COOKIE_SECURE = True
    OIDC_REQUIRE_VERIFIED_EMAIL = True
    OIDC_OPENID_REALM: 'flowx'
    OIDC_INTROSPECTION_AUTH_METHOD: 'client_secret_post'
    CUSTOM_SECURITY_MANAGER = OIDCSecurityManager
    AUTH_USER_REGISTRATION = False
    AUTH_USER_REGISTRATION_ROLE = 'Admin'
    OVERWRITE_REDIRECT_URI = 'https://{{ .Values.flowx.ingress.reporting }}/oidc_callback'
    '''
    --------------------------------------------------------------
    '''
```
