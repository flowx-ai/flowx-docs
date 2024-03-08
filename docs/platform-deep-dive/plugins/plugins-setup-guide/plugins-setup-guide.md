# Plugins setup guides

To set up a plugin in your environment, you must go through the next steps:

* make sure you have all the prerequisites deployed on your environment (for example a [Redis](../../../platform-overview/frameworks-and-standards/event-driven-architecture-frameworks/intro-to-redis.md) cache instance, a DB instance, etc)
* make the necessary configurations for each plugin (DB connection data, related Kafka topic names, etc)

Once you have deployed the necessary plugins in your environment, you can start integrating them in your process definitions.

All of them listen for Kafka events sent by the [**Engine**](../../../terms/flowxai-process-engine) and performed certain actions depending on the received data. They can also send data back to the Engine.

Some of them require some custom templates to be configured, for these cases, a [WYSIWYG Editor](../wysiwyg.md) is provided.

Let's go into more details on setting up and using each of them:

#### More details about the notification plugin

[Notifications plugin setup](notifications-plugin-setup/)

#### More details about the customer management plugin


[Customer Management plugin configuration](customer-management-plugin-configuration)


#### More details about the OCR plugin


[OCR plugin setup](ocr-plugin-setup)


#### More details about the document management plugin


[Documents plugin setup](documents-plugin-setup/)


#### More details about the task management plugin


[Task management plugin setup](task-management-plugin-setup/)
