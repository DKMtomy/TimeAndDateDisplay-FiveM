-- Register a FiveM event for updating the time and date display
RegisterNetEvent('TimeAndDateDisplay-FiveM')

-- Event handler function for updating the time and date display
AddEventHandler('TimeAndDateDisplay-FiveM', function(time)
  -- If configured to show the server name, add it to the time string
  if Config.ShowServerName and Config.ServerName then
    time = time .. " | © " .. Config.ServerName
  end

  -- If configured to show the player name, add it to the time string
  if Config.ShowPlayerName then
    local playerName = GetPlayerName(NetworkGetEntityOwner(PlayerPedId()))
    if playerName then
      time = time .. "\nPlayer Name: " .. playerName
    end
  end

  -- If configured to show the player ID, add it to the time string
  if Config.ShowPlayerID then
    local playerID = GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))
    if playerID then
      time = time .. "\nPlayer ID: " .. playerID
    end
  end

  -- Send the updated time string to the NUI element
  SendNUIMessage({
    action = "setTimeAndDate",
    time = time
  })
end)
