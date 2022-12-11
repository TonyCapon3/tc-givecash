local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('tc-giveCash:server:charge', function(id, amount)
    local src = source
    
    local giver = QBCore.Functions.GetPlayer(src)
    local given = QBCore.Functions.GetPlayer(tonumber(id))
    local givenPed = GetPlayerPed(tonumber(id))
    local giverPed = GetPlayerPed(src)
    if not giver.PlayerData.metadata["isdead"] then
        local check = #(GetEntityCoords(givenPed) - GetEntityCoords(giverPed))

        if check < 10.0 then
            if tonumber(amount) > 0 then
                giver.Functions.RemoveMoney('cash', tonumber(amount))
                given.Functions.AddMoney('cash', tonumber(amount))
                TriggerClientEvent('QBCore:Notify', src, 'Sent $'..tonumber(amount).." to"..id, 'success')
            else
                TriggerClientEvent('QBCore:Notify', src, 'Can\'t Send $0', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Too far', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Can\'t Send Money When Dead.', 'error')
    end
    

end)


