RegisterServerEvent("tpz_notify:sendNotificationTo")
AddEventHandler("tpz_notify:sendNotificationTo", function(targetId, title, message, icon, type, duration)
  local _source = tonumber(targetId)

  if GetPlayerName(_source) then
    TriggerClientEvent("tpz_notify:sendNotification", _source, title, message, icon, type, duration)
  end

end)
