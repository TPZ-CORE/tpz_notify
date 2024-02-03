# TPZ-CORE Notify

# Installation

1. When opening the zip file, open `tpz_notify-main` directory folder and inside there will be another directory folder which is called as `tpz_notify`, this directory folder is the one that should be exported to your resources (The folder which contains `fxmanifest.lua`).

2. Add `ensure tpz_notify` before `tpz_core` in the resources.cfg or server.cfg, depends where your scripts are located.

# Developers

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

## Screenshot Displays

![image](https://github.com/TPZ-CORE/tpz_notify/assets/152554963/296149a8-2f12-4ce4-a9fe-31b0c9824a09)
