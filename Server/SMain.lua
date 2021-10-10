AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        TriggerClientEvent('chat:addSuggestion', -1, '/'..Config.ChangeDimension, _U('changedimension_help'), {
            { name = _U('param_1'), help = _U('param_description_1') },
            { name = _U('param_2'), help = _U('param_description_2') }
        })
        return print(_U('resource_started', resourceName))
    end
end)

RegisterCommand(Config.ChangeDimension, function(source, args)
    local playerId <const> = source
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local targetId = tonumber(args[1])
    local dimension = tonumber(args[2])
    local xTarget = ESX.GetPlayerFromId(targetId)

    if xPlayer.getGroup() == 'admin' then
        if args[1] and tonumber(args[1]) and xTarget then
            if args[2] and tonumber(args[2]) then
                SetPlayerRoutingBucket(targetId, dimension)
                xPlayer.showNotification(_U('changed_dimension', GetPlayerName(targetId), dimension))
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
    local playerId <const> = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    xPlayer.showNotification(_U('dimension_set_0'))
    SetPlayerRoutingBucket(playerId, 0)
end)

-- View dimension Command --
RegisterCommand(Config.ViewDimension, function(source)
    local playerId <const> = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    xPlayer.showNotification(_U('view_dimension', GetPlayerRoutingBucket(playerId)))
end)