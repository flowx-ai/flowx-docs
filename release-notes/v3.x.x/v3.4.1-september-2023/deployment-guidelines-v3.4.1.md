# Deployment guidelines v3.4.1

<Info>
  Do not forget, when upgrading to a new platform version, always ensure that your installed component versions match the versions specified in the release notes. To verify this, navigate to **FLOWX.AI Designer > Platform Status**.
</Info>

<Warning>
  After updating to **3.4.1** FLOWX.AI release, it is not possible to import old process definitions into the new platform release (available for exports from releases **\< 3.4.1**).
</Warning>

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release-notes/release_platform_version_check.png)

## Component versions

| 🧩                             | 3.4.1      | 3.4.0  | 3.3.0   | 3.2.0  | 3.1.0  | 3.0.0  | 2.14.0   | 2.13.0  | 2.12.0  | 2.11.0  | 2.10.0  | 2.9.0   | 2.8.1   | 2.8.0   | 2.7.0   | 2.6.0   | 2.5.0   | 2.4.0   | 2.3.0   | 2.2.0   |
| ------------------------------ | ---------- | ------ | ------- | ------ | ------ | ------ | -------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- |
| **process-engine**             | **4.3.1**  | 4.1.0  | 3.6.0   | 2.2.1  | 2.1.2  | 2.0.7  | 0.4.104  | 0.4.95  | 0.4.90  | 0.4.83  | 0.4.60  | 0.4.49  | 0.4.44  | 0.4.42  | 0.4.42  | 0.4.36  | 0.4.29  | 0.4.22  | 0.4.21  | 0.4.18  |
| **admin**                      | **3.3.7**  | 3.1.1  | 2.5.2   | 2.2.2  | 2.1.3  | 2.0.8  | 0.3.119  | 0.3.103 | 0.3.92  | 0.3.81  | 0.3.60  | 0.3.55  | 0.3.47  | 0.3.43  | 0.3.40  | 0.3.36  | 0.3.34  | 0.3.29  | 0.3.23  | 0.3.21  |
| **designer**                   | **3.35.6** | 3.33.2 | 3.28.11 | 3.21.1 | 3.15.1 | 3.2.1  | 2.78.4-1 | 2.63.6  | 2.60.7  | 2.48.9  | 2.39.2  | 2.33.0  | 2.28.1  | 2.24.2  | 2.23.0  | 2.19.2  | 2.18.2  | 2.17.4  | 2.15.2  | 2.14.4  |
| **@flowx/ui-sdk**              | **3.35.6** | 3.33.2 | 3.28.11 | 3.21.1 | 3.15.1 | 3.2.1  | n/a      | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     |
| **@flowx/ui-toolkit**          | **3.35.6** | 3.33.2 | 3.28.11 | 3.21.1 | 3.15.1 | 3.2.1  | n/a      | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     |
| **@flowx/ui-theme**            | **3.35.6** | 3.33.2 | 3.28.11 | 3.21.1 | 3.15.1 | 3.2.1  | n/a      | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     |
| **paperflow-web-components**   | **3.35.6** | 3.33.2 | 3.28.11 | 3.21.1 | 3.15.1 | 3.2.1  | 2.78.4-1 | 2.63.6  | 2.60.7  | 0.2.10  | 0.2.10  | 0.2.10  | 0.2.6   | 0.2.6   | 0.2.6   | 0.2.6   | 0.2.6   | 0.2.6   | 0.2.6   | 0.2.5   |
| **flowx-process-renderer**     | -          | -      | -       | -      | -      | -      | 2.78.4-1 | 2.63.6  | 2.60.7  | 2.48.9  | 2.39.2  | 2.33.0  | 2.28.1  | 2.24.2  | 2.23.0  | 2.19.2  | 2.18.2  | 2.17.4  | 2.15.2  | 2.14.4  |
| **cms-core**                   | **1.3.9**  | 1.3.6  | 1.3.0   | 1.2.0  | 1.0.3  | 1.0.2  | 0.2.38   | 0.2.36  | 0.2.33  | 0.2.30  | 0.2.25  | 0.2.23  | 0.2.23  | 0.2.23  | 0.2.23  | 0.2.23  | 0.2.20  | 0.2.20  | 0.2.18  | 0.2.17  |
| **scheduler-core**             | **1.2.4**  | 1.1.0  | 1.0.4   | 1.0.4  | 1.0.4  | 1.0.1  | 0.0.34   | 0.0.34  | 0.0.34  | 0.0.33  | 0.0.28  | 0.0.27  | 0.0.27  | 0.0.27  | 0.0.27  | 0.0.27  | 0.0.24  | 0.0.24  | 0.0.23  | 0.0.23  |
| **events-gateway**             | **1.1.0**  | 1.0.6  | 1.0.2   | -      | -      | -      | -        | -       | -       | -       | -       | -       | -       | -       | -       | -       | -       | -       | -       | -       |
| **notification-plugin**        | **2.0.8**  | 2.0.5  | 2.0.4   | 2.0.4  | 2.0.3  | 2.0.1  | 1.0.206  | 1.0.206 | 1.0.206 | 1.0.205 | 1.0.200 | 1.0.198 | 1.0.198 | 1.0.197 | 1.0.194 | 1.0.194 | 1.0.191 | 1.0.191 | 1.0.190 | 1.0.190 |
| **document-plugin**            | **2.0.8**  | 2.0.6  | 2.0.4   | 2.0.3  | 2.0.3  | 2.0.2  | 1.0.53   | 1.0.53  | 1.0.53  | 1.0.52  | 1.0.47  | 1.0.42  | 1.0.41  | 1.0.38  | 1.0.37  | 1.0.37  | 1.0.35  | 1.0.35  | 1.0.31  | 1.0.31  |
| **ocr-plugin**                 | **1.0.12** | 1.0.8  | 1.0.8   | 1.0.2  | 0.1.33 | 0.1.33 | 0.1.33   | 0.1.33  | 0.1.5   | 0.1.5   | 0.1.5   | 0.1.5   | 0.1.5   | 0.1.5   | 0.1.5   | 0.1.5   | 0.1.5   | 0.1.5   | 0.0.109 | 0.0.109 |
| **license-core**               | **1.0.7**  | 1.0.4  | 1.0.2   | 1.0.2  | 1.0.2  | 1.0.1  | 0.1.28   | 0.1.28  | 0.1.28  | 0.1.27  | 0.1.23  | 0.1.19  | 0.1.18  | 0.1.18  | 0.1.18  | 0.1.18  | 0.1.15  | 0.1.15  | 0.1.13  | 0.1.13  |
| **customer-management-plugin** | **0.2.8**  | 0.2.6  | 0.2.4   | 0.2.3  | 0.2.3  | 0.2.1  | 0.1.28   | 0.1.28  | 0.1.28  | 0.1.27  | 0.1.23  | 0.1.22  | 0.1.22  | 0.1.22  | 0.1.22  | 0.1.22  | 0.1.20  | 0.1.20  | 0.1.18  | 0.1.18  |
| **task-management-plugin**     | **3.0.3**  | 3.0.0  | 2.1.2   | 1.0.4  | 1.0.4  | 1.0.1  | 0.0.42   | 0.0.42  | 0.0.40  | 0.0.37  | 0.0.29  | 0.0.28  | 0.0.28  | 0.0.27  | 0.0.27  | 0.0.27  | 0.0.22  | 0.0.22  | 0.0.21  | 0.0.21  |
| **data-search**                | **0.2.6**  | 0.2.3  | 0.2.0   | 0.1.4  | 0.1.4  | 0.1.3  | 0.0.8    | 0.0.8   | 0.0.6   | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     |
| **audit-core**                 | **2.1.3**  | 2.1.0  | 1.0.6   | 1.0.5  | 1.0.4  | 1.0.1  | 0.0.8    | 0.0.5   | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     |
| **reporting-plugin**           | 0.1.2      | 0.1.2  | 0.0.40  | 0.0.40 | 0.0.40 | 0.0.39 | 0.0.39   | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     |
| **advancing-controller**       | **0.3.5**  | 0.3.2  | 0.3.0   | 0.1.4  | 0.1.4  | 0.1.2  | 0.0.6    | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     |
| **iOS renderer**               | 2.3.0      | 2.3.0  | 2.1.0   | 2.0.1  | 2.0.0  | 2.0.0  | n/a      | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     |
| **Android renderer**           | 2.1.4      | 2.1.4  | 2.0.1   | 2.0.1  | 2.0.1  | 2.0.1  | n/a      | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     | n/a     |

<Warning>
  With the release of **FLOWX.AI 3.0**, there have been some changes that you need to be aware when upgrading to the latest version:

  * The `flowx-process-renderer` has been migrated to `@flowx\ui-sdk`.
  * As of **FLOWX.AI 4.0**, the `paperflow-web-components` library will be deprecated. Instead, the new components can be found in `@flowx/ui-toolkit`.
</Warning>

### Recommended Versions for FLOWX.AI 3.4.1 ☑️

| FLOWX.AI Platform Version | Component name    | Recommended version (tested versions) |
| ------------------------- | ----------------- | ------------------------------------- |
| 3.4.1                     | Keycloak          | 18.0.x                                |
| 3.4.1                     | Kafka             | 3.2.3                                 |
| 3.4.1                     | PostgreSQL        | 14.3.0                                |
| 3.4.1                     | MongoDB           | 5.0.8                                 |
| 3.4.1                     | Redis             | 6.2.6                                 |
| 3.4.1                     | Elasticsearch     | 7.17                                  |
| 3.4.1                     | OracleDB          | 19.8.0.0.0                            |
| 3.4.1                     | Angular (Web SDK) | 15.0.0                                |

<Info>
  FlowX.AI supports any version of the third-party components listed as prerequisites.

  For optimal performance and reliability, our internal QA process validates new releases using specific versions as indicated in the provided table.
  While exploring alternative versions that suit your company's specific requirements, we recommend referring to the compatibility matrix for guidance.

  In the unlikely event that you encounter any compatibility issues with FlowX.AI, please open a support ticket [**here**](https://flowxai.zendesk.com/), and our dedicated team will address and resolve any identified bugs following our standard support process.

  Compatibility Matrix:

  * FLOWX.AI Platform: Recommended and tested versions
  * Third-Party Components: Supported versions based on specific requirements and client preferences
</Info>

# Additional configuration

This section outlines the supplementary configurations required to leverage the newly introduced features within FLOWX.AI (for a smooth transition please check first what's new in [3.4.0](../v3.4.0-september-2023/v3.4.0-september-2023.md)).

## Scheduler configuration

```yaml
scheduler:
  thread-count: 30  # Configure the number of threads to be used for sending expired messages.
  callbacks-thread-count: 60 # Configure the number of threads for handling Kafka responses, whether the message was successfully sent or not
  cronExpression: "*/10 * * * * *" #every 10 seconds
  retry: # new retry mechanism
    max-attempts: 3
    seconds: 1
    thread-count: 3
    cronExpression: "*/10 * * * * *" #every 10 seconds
  cleanup:
    cronExpression: "*/25 * * * * *" #every 25 seconds
```

### Explanation

* `SCHEDULER_THREAD_COUNT` - Used to configure the number of threads to be used for sending expired.
* `CALLBACKS_THREAD_COUNT` - Used to configure the number of threads for handling Kafka responses, whether the message was successfully sent or not.

### New retry mechanism

* `SCHEDULER_RETRY_THREAD_COUNT` - Specify the number of threads to use for resending messages that need to be retried.
* `SCHEDULER_RETRY_MAX_ATTEMPTS` - This configuration parameter sets the number of retry attempts. For instance, if it's set to 3, it means that the system will make a maximum of three retry attempts for message resending.
* `SCHEDULER_RETRY_SECONDS` - This configuration parameter defines the time interval, in seconds, for retry attempts. For example, when set to 1, it indicates that the system will retry the operation after a one-second delay.

[Scheduler setup guide](../../docs/platform-setup-guides/scheduler-setup-guide)

## Revised Cache Key Organization

To ensure a smooth transition for the **3.4.1** release, it is crucial to make use of the clear cache endpoint with the following request body:

**Request:**

```http
POST /api/internal/cache/clear
```

<Info>
  This endpoint is designed to purge Redis caches selectively. It will exclusively delete caches that are specified in the admin microservice properties under the property key: "application.redis.clearable-caches".
</Info>

Request body:

```json
{
    "cacheNames": [
        "events",
        "admin",
        "allowedSwimlanes",
        "initiatedProcessFromStartEvent",
        "flowx:core"
        ]
}
```

<Warning>
  Please take note that after upgrading to the new system version, you should refrain from including the flowx:core cache in the request body when invoking the clear cache endpoint to avoid unintended consequences.
</Warning>
