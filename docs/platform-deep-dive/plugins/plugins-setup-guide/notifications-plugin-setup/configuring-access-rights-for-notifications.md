# Configuring access rights for Notifications

Granular access rights can be configured for restricting access to the Notification plugin component.


The following access authorizations are provided, with the specified access scopes:

1. **Manage-notification-templates** - for configuring access for managing notification templates

Available scopes:

* import - users are able to import notification templates
* read - users are able to view notification templates
* edit - users are able to edit notification templates
* admin - users are able to publish or delete notification templates

The Notification plugin is preconfigured with the following default users roles for each of the access scopes mentioned above:

* manage-notification-templates
  * import
    * ROLE_NOTIFICATION_TEMPLATES_IMPORT
    * ROLE_NOTIFICATION_TEMPLATES_EDIT
    * ROLE_NOTIFICATION_TEMPLATES_ADMIN
  * read:
    * ROLE_NOTIFICATION_TEMPLATES_READ
    * ROLE_NOTIFICATION_TEMPLATES_IMPORT
    * ROLE_NOTIFICATION_TEMPLATES_EDIT
    * ROLE_NOTIFICATION_TEMPLATES_ADMIN
  * edit:
    * ROLE_NOTIFICATION_TEMPLATES_EDIT"
    * ROLE_NOTIFICATION_TEMPLATES_ADMIN"
  * admin:
    * ROLE_NOTIFICATION_TEMPLATES_ADMIN

:::caution
These roles need to be defined in the chosen identity provider solution.
:::

In case other custom roles are needed, you can configure them using environment variables. More than one role can be set for each access scope.

To configure access for each of the roles above, adapt the following input:

**`SECURITY_ACCESSAUTHORIZATIONS_AUTHORIZATIONNAME_SCOPES_SCOPENAME_ROLESALLOWED: NEEDED_ROLE_NAMES`**

Possible values for AUTHORIZATIONNAME: `MANAGENOTIFICATIONTEMPLATES`.

Possible values for SCOPENAME: import, read, edit, admin.

For example, if you need to configure role access for read, insert this:

```
SECURITY_ACCESSAUTHORIZATIONS_MANAGENOTIFICATIONTEMPLATES_SCOPES_READ_ROLESALLOWED: ROLE_NAME_TEST
```
