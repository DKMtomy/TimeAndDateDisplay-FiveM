local WAIT_TIME = 30000 -- 30 seconds

function getTime()
    local format
    if Config.ShowOnlyTime then
        format = "%H:%M"
    elseif Config.ShowOnlyDate then
        format = Config.DayMonthYear and "%d-%m-%Y" or
                 Config.MonthDayYear and "%m-%d-%Y" or
                 Config.YearMonthDay and "%Y-%m-%d" or
                 Config.YearDayMonth and "%Y-%d-%m" or
                 "%d-%m-%Y"
    else -- ShowDateAndTime or no config option set
        format = Config.DayMonthYear and "%d-%m-%Y at %H:%M" or
                 Config.MonthDayYear and "%m-%d-%Y at %H:%M" or
                 Config.YearMonthDay and "%Y-%m-%d at %H:%M" or
                 Config.YearDayMonth and "%Y-%d-%m at %H:%M" or
                 "%d-%m-%Y at %H:%M"
    end
    return os.date(format, os.time() + Config.TimezoneOffset * 60 * 60)
end

Citizen.CreateThread(function()
    while true do
        TriggerClientEvent('TimeAndDateDisplay-FiveM', -1, getTime())
        Wait(WAIT_TIME)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Wait(2500)
        TriggerClientEvent('TimeAndDateDisplay-FiveM', -1, getTime())
    end
end)

AddEventHandler("playerJoining", function (data)
    TriggerClientEvent('TimeAndDateDisplay-FiveM', source, getTime())
end)
