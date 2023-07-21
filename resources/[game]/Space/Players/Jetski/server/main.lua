RegisterNetEvent('h4ci:locajetski')
AddEventHandler('h4ci:locajetski', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local argentdujoueurcash = xPlayer.getAccount('cash').money
    if argentdujoueurcash >= prix then
        xPlayer.removeAccountMoney('cash', 250)
        TriggerClientEvent('esx:showNotification', source, "~g~Jetski~w~ obtenu ! ~r~-250$")
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas assez d\'argent.')
    end
end)