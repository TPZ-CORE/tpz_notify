local HasNotificationActive = false
local CooldownTime          = 0

local QueueList             = {}
local CurrentQueueIndex     = 1

-----------------------------------------------------------
--[[ Events ]]--
-----------------------------------------------------------

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
		
    QueueList = {}
end)

RegisterNetEvent("tpz_notify:sendNotification")
AddEventHandler("tpz_notify:sendNotification", function(title, message, actionType, notifyType, duration, align)

    local newNotifyId      = #QueueList + 1
    QueueList[newNotifyId] = true

    while CurrentQueueIndex ~= (newNotifyId) do
        Wait(1000)
    end

    Wait(1000)
		
    CooldownTime = duration
    HasNotificationActive = true

    SetNUIState(HasNotificationActive, title, message, actionType, notifyType, align)
end)

-----------------------------------------------------------
--[[ Notifications ]]--
-----------------------------------------------------------

OpenNUI = function ()
    SetNUIState(true)
end

SetNUIState = function(state, title, message, actionType, notifyType, align)

    HasNotificationActive = state

    if Config.NotifyTypes[notifyType] then
        notifyType = Config.NotifyTypes[notifyType]
    end

    if not align then
        align = 'left'
    end

	SendNUIMessage({
		type = "enable_ui",
		enable = state,
        title = title,
        message = message,
        actionType = actionType,
        color = notifyType,
        align = align,
	})

end

CloseNUIProperly = function ()
    
    if HasNotificationActive then
        SetNUIState(false)
    end
end

-----------------------------------------------------------
--[[ NUI Callbacks ]]--
-----------------------------------------------------------

RegisterNUICallback('close', function()
    Wait(1000)
	SetNUIState(false)
end)

-----------------------------------------------------------
--[[ NUI Callbacks ]]--
-----------------------------------------------------------

-- The following task is running properly the cooldown display timer.
-- It is mostly required when another notification is triggered while 
-- There is already one running.
Citizen.CreateThread(function() 
    while true do
        Wait(1000)

        if CooldownTime > 0 then
            CooldownTime = CooldownTime - 1

            if CooldownTime <= 0 then

                CooldownTime = 0

                SendNUIMessage({action = 'close'})
					
		CurrentQueueIndex = CurrentQueueIndex + 1
            end

        end

    end
end)
