AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print(_U('resource_started', resourceName))
end)

RegisterCommand(Config.ChangeDimension, function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = tonumber(args[1])
    local dimension = tonumber(args[2])
    local xTarget = ESX.GetPlayerFromId(playerId)

    if xPlayer.getGroup() == 'admin' then
        if args[1] and tonumber(args[1]) and xTarget then
            if args[2] and tonumber(args[2]) then
                SetPlayerRoutingBucket(playerId, dimension)
                xPlayer.showNotification(_U('changed_dimension', GetPlayerName(playerId), dimension))
            else
                xPlayer.showNotification(_U('not_dimension'))
            end
        else
            xPlayer.showNotification(_U('not_playerid'))
        end
    else
        xPlayer.showNotification(_U('not_perms'))
    end
end)

-- Autofix Command --
RegisterCommand(Config.AutoFixCommand, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.showNotification(_U('dimension_set_0'))
    SetPlayerRoutingBucket(source, 0)
end)

-- View dimension Command --
RegisterCommand(Config.ViewDimension, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.showNotification(_U('view_dimension', GetPlayerRoutingBucket(source)))
end)