# tpz_notify

> Client Trigger

 ```lua

-- @param title
-- @param message
-- @param icon (icon name directly from img/types)
-- @param notificationType ("success", "error", "info")
-- @param duration
TriggerEvent("tpz_notify:sendNotification", "Mailbox Notification", "This is a notification", "mail", "info", 15)

```

### The following event is called from Client to Server to send a notification on the selected target player id.

```lua

-- @param title
-- @param message
-- @param icon (icon name directly from img/types)
-- @param notificationType ("success", "error", "info")
-- @param duration
TriggerServerEvent("tpz_notify:sendNotificationTo", targetId, "Mailbox Notification", "This is a notification", "mail", "info", 15)

```

> Server Trigger

```lua

-- @param title
-- @param message
-- @param icon (icon name directly from img/types)
-- @param notificationType ("success", "error", "info")
-- @param duration
TriggerClientEvent("tpz_notify:sendNotification", source, "Mailbox Notification", "This is a notification", "mail", "info", 15)

```

### The following event is called from Server to Server to send a notification on the selected target player id.


```lua

-- @param title
-- @param message
-- @param icon (icon name directly from img/types)
-- @param notificationType ("success", "error", "info")
-- @param duration
TriggerEvent("tpz_notify:sendNotificationTo", targetId, "Mailbox Notification", "This is a notification", "mail", "info", 15)

```
