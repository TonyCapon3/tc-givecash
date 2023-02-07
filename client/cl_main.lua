local function cashMenu()
    local input = exports['qb-input']:ShowInput({
        header = "Give Cash",
        submitText = "Give Cash",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'ID Of Player'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$ amount'
            }
        }
    })
    if input then
        if not input.id or not input.amount then return end
        TriggerServerEvent("tc-giveCash:server:charge", input.id, input.amount)
    end
end

CreateThread(function()
    exports['qb-target']:AddGlobalPlayer({
        options = {
            { 
                action = function()
                    cashMenu()
                end,
                icon = "fas fa-money",
                label = "Give Cash",
            },
        },
        distance = 3.0 
    })
end)



