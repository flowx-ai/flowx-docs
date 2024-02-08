# FLOWX.AI architecture

Let's delve into the core components that power the FLOWX.AI platform, providing a comprehensive understanding of its capabilities and functionalities.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/release34/architecture_diagram_22_01_24.png)

## FLOWX.AI Designer

The FLOWX.AI Designer is a collaborative, no-code, web-based application development environment, designed to facilitate the creation of web and mobile applications without the need for coding expertise. It offers a wide range of capabilities:

* Develop processes based on [BPMN 2.0](./frameworks-and-standards/business-process-industry-standards/intro-to-bpmn) standards.
* Configure user interfaces for processes, both generated and custom.
* Define business rules and validations via [DMN](./frameworks-and-standards/business-process-industry-standards/intro-to-dmn) files or via the [MVEL](./frameworks-and-standards/business-process-industry-standards/intro-to-mvel), or other supported [scripting languages](../building-blocks/supported-scripts).
* Create [integration connectors](../platform-deep-dive/integrations) in a visual manner.
* Design data models for your applications.
* Adding new capabilities by using [plugins](../platform-deep-dive/plugins/plugins.md).
* Manage [users access](../platform-deep-dive/user-roles-management/swimlanes.md) roles effectively.

:::info
[FLOWX.AI Designer](../flowx-designer/designer.md) is built to administrate everything in FLOWX.AI. It is a web application that runs in the browser, meaning that it resides out of a FLOWX deployment.
:::

The platform has **no-code/full-code capabilities**, meaning applications can be developed in a visual way, available for anyone with a powerful business idea. So we’re talking about business analysts, product managers - people without advanced programming skills, and also experienced developers.

The process visual designer works on [BPMN 2.0 standard](../platform-overview/frameworks-and-standards/business-process-industry-standards/business-process-industry-standards.md) - meaning that the learning curve for business analysts or product managers is quite fast. Thus, creating new applications (e.g. onboarding an SME client for banks) or adding new functionality (allow personal data changes in an app) takes only 10 days, instead of 6 to 8 months.

Explore more:

[FLOWX.AI Designer](../flowx-designer/designer.md)

## Microservices

FLOWX.AI leverages a suite of microservices to drive its functionality:

* [**FLOWX.AI Engine**](#flowxai-engine)
* [**FLOWX.AI SDKs**](#flowxai-sdks)
* [**FLOWX.AI Content Management**](#flowxai-content-management)
* [**FLOWX.AI Scheduler**](#flowxai-scheduler)
* [**FLOWX.AI License Manager**](#flowxai-scheduler)
* [**FLOWX.AI Admin**](#flowxai-admin)

### FLOWX.AI Engine

We call it the engine because it’s a nice analogy, once deployed on an existing stack, FLOWX.AI becomes the core of your digital operating model.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-overview/engine_architecture.png)

You can use FLOWX Engine to do the following:

* create any type of external or internal facing application
* redesign business processes from analog, paper-based ones to fully digital and automated processes
* manage integrations, so you can hook it up to existing CRMs, ERPs, KYC, transaction data and many more
* to read process definitions (if it is connected to the same DB as FLOWX.AI Admin)

[FLOWX Engine](../platform-deep-dive/core-components/flowx-engine.md) runs the business processes, coordinating integrations and the omnichannel UI. It is a [Kafka-based](./frameworks-and-standards/event-driven-architecture-frameworks/intro-to-kafka-concepts) event-driven platform, that is able to orchestrate, generate and integrate with any type of legacy system, without expensive or risky upgrades.

This is extremely important because often, digital apps used by a bank’s clients, for example, are limited by the load imposed by the core banking system. And the customers see blocked screens and endlessly spinning flywheels. FLOWX.AI buffers this load, offering a 0.2s response time, thus the customer never has to wait for data to load.

[FLOWX Engine](../platform-deep-dive/core-components/flowx-engine.md)

### FLOWX.AI SDKs

SDKs are used in the [Web (Angular)](../platform-deep-dive/core-components/renderer-sdks/angular-renderer.md), [iOS](../platform-deep-dive/core-components/renderer-sdks/ios-renderer.md), and [Android](../platform-deep-dive/core-components/renderer-sdks/android-renderer.md) applications to render the process screens and orchestrate the [custom components](../building-blocks/ui-designer/ui-component-types/root-components/custom.md).

Explore more:

[FLOWX.AI SDKs](../platform-deep-dive/core-components/renderer-sdks/angular-renderer.md)

### FLOWX.AI Content Management

This is another Java microservice that enables you to store and manage content. **The go-to place for all taxonomies.** The extension offers a convenient way of managing various content pieces such as lists or content translations. Anything that is under content management is managed by the [CMS backend service](../platform-setup-guides/cms-setup-guide/cms-setup-guide.md). To store content, the service will use a MongoDB database (unstructured database). For example, each time you edit an [enumeration](../platform-deep-dive/core-components/core-extensions/content-management/enumerations.md), the FLOWX.AI Designer will send an HTTP request to the microservice.

[Content Management](../platform-deep-dive/core-components/core-extensions/content-management/content-management.md)

### FLOWX.AI Scheduler

If you need to **set a timer on** a process that needs to end after X days, you can use the FLOWX.AI Scheduler microservice. It is a service that is able to receive requests (like a reminder application) to remind you in X amount of time to do something.

:::info
When you start a process, the process must have an expiry date.
:::

Scheduler microservice communicates with the FLOWX.AI Engine through Kafka Event Queue ⇾ it creates a new message (write some data) then will send that message to Kafka (with the scheduler address) → when the reminder time comes up, the scheduler will put back a new message in the Kafka layer with engine's destination (time + ID of the process).

[Scheduler](../platform-deep-dive/core-components/core-extensions/scheduler.md)

### FLOWX.AI License Manager

Used for displaying usage reports related to the FLOWX.AI platform within the FLOWX.AI Designer, ensuring transparent monitoring and management of the platform.

[License Manager](../platform-deep-dive/core-components/core-extensions/license-engine.md)

### FLOWX.AI Admin

Used for storing and editing process definitions, FLOWX.AI Admin connects to the same database as the FLOWX.AI Engine, ensuring consistency in data management.

## Plugins

Plugins are bits of functionality that allow you to expand the functionality of the platform - for example, we have the following custom plugins:

* [FLOWX Notifications Plugin](../platform-deep-dive/plugins/custom-plugins/notifications-plugin/notifications-plugin.md)
* [FLOWX Documents Plugin](../platform-deep-dive/plugins/custom-plugins/documents-plugin/documents-plugin.md)
* [FLOWX OCR Plugin](../platform-deep-dive/plugins/custom-plugins/ocr-plugin.md)
* [FLOWX Task Management Plugin](../platform-deep-dive/plugins/custom-plugins/task-management/task-management.md)

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-overview/plugins_architecture.png)

[Plugins](../platform-deep-dive/plugins/plugins.md)

## Authorization & Session Manager

We recommend Keycloak, a component that allows you to create users and store credentials. It can be also used for authorization - defining groups, and assigning roles to users.

Every communication that comes from a consumer application, goes through a public entry point (API Gateway). To communicate with this component, the consumer application tries to start a process and the public entry point will check for authentication (Keycloak will send you a token) and the entry point validates it.

[Keycloak Documentation](https://www.keycloak.org/documentation)

## Integrations

Connecting your legacy systems or third-party apps to the FLOWX.AI Engine is easily done through [custom integrations](../platform-deep-dive/integrations/integrations.md). These can be developed using your preferred tech stack, the only requirement is that they connect to Kafka. These could include legacy APIs, custom file exchange solutions, or RPA.

![](https://s3.eu-west-1.amazonaws.com/docx.flowx.ai/platform-overview/integrations_architecture.png)

[Integrations](../platform-deep-dive/integrations/integrations.md)

In summary, FLOWX.AI offers a robust and versatile architecture that empowers users to create, manage, and integrate applications seamlessly, without the need for extensive coding expertise. Its microservices, SDKs, and plugins work in harmony to drive efficiency and innovation in application development and business process management.